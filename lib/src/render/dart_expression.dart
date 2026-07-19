import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/render/dart_type.dart';
import 'package:space_gen/src/string.dart';

/// A Dart expression as structure rather than text.
///
/// The expression-level counterpart to [DartType], and for the same reason:
/// facts about an expression should be *derived* from what it is, not
/// recovered by inspecting rendered source. [canBeConst] is the motivating
/// case — a constructor invocation can be const iff its constructor is
/// declared `const` and every argument can be, which is a fold over the
/// tree and not something a composite should have to thread by hand.
///
/// Unlike [DartType], the tree does *not* render itself. Rendering lives in
/// [DartExpressionSerializer], because the source for a given expression
/// depends on where the text lands: `const` must be written when the
/// destination evaluates at runtime, and must not be when the destination is
/// already a constant context (an enclosing `const` declaration, a parameter
/// default), where it would trip `unnecessary_const`. That is a property of
/// the destination, not of the expression, so it cannot be a method on the
/// node — and it has to thread down through nesting, which is why it is a
/// serializer carrying context rather than a flag on a call.
///
/// See `doc/dart_expression.md` for the decision record, including why
/// `package:code_builder` was evaluated and rejected.
@immutable
sealed class DartExpression extends Equatable {
  const DartExpression();

  /// Whether this expression *could* be evaluated at compile time — with
  /// the keyword written, or by sitting in a context that is already
  /// constant.
  ///
  /// Deliberately not `isConst`. Three different things get called that,
  /// and only this one is a property of the tree:
  ///
  /// - **is a constant** — actually evaluated at compile time. `5` always
  ///   is; `Foo(1)` only if it is written `const Foo(1)` or lands in a
  ///   constant context. That depends on the destination, so the tree
  ///   cannot answer it.
  /// - **can be const** — this getter. A constructor invocation qualifies
  ///   when its constructor is declared `const` *and* every argument
  ///   qualifies. `[1, 2]` qualifies even though, written bare in a
  ///   runtime context, it allocates a fresh list each time.
  /// - **is written `const`** — the keyword, pure syntax. That is
  ///   [DartExpressionSerializer.isConstContext]'s business, not the
  ///   tree's.
  ///
  /// Derived, never stored. That derivation is the reason this IR exists:
  /// see `doc/dart_expression.md`.
  bool get canBeConst;

  /// How tightly this expression binds, so the serializer can decide where
  /// parentheses are required instead of each producer reasoning it out.
  DartPrecedence get precedence;

  /// Debug form (`DartLiteral(5)`), not Dart source. Rendering goes
  /// through [DartExpressionSerializer] — an expression cannot serialize
  /// itself, because how it renders depends on where the text lands.
  @override
  bool get stringify => true;
}

/// How tightly an expression binds, loosest first.
///
/// Only the levels the generator actually emits, not Dart's full table —
/// there is no arithmetic or comparison in generated `fromJson`/`toJson`
/// code, and an unused level is a level nothing tests.
///
/// Composition asks rather than assumes. Before this, two
/// `fromJsonExpression` overrides answered "does a cast on the left of
/// `??` need parens" independently and disagreed — `RenderNumeric` emitted
/// `(json['x'] as int?) ?? 0`, `RenderPod` emitted
/// `json['x'] as bool? ?? false`.
enum DartPrecedence {
  /// `throw x` — binds looser than everything, including a lambda body.
  throw_,

  /// `(e) => body`.
  lambda,

  /// `x ?? y`.
  ifNull,

  /// `x as T`.
  cast,

  /// Selectors: `x.y`, `x?.y`, `f(...)`. Left-associative, so a target
  /// must already be at this level or tighter.
  postfix,

  /// Literals, identifiers, and anything else that never needs parens.
  primary,
}

/// Renders a [DartExpression] to Dart source.
///
/// Separate from the tree on purpose. Whether a `const` keyword belongs in
/// front of an expression is a fact about the *destination* — a `??`
/// right-hand side evaluates at runtime and wants one, a parameter default
/// is already a constant context and must not have one. The same tree
/// therefore has more than one correct rendering, so it cannot render
/// itself.
///
/// Context also has to travel down through nesting. Writing `const` at one
/// level makes everything below it constant, so children must not repeat
/// it; but where no keyword is written the context passes through, which is
/// what lets a constant child inside a runtime parent get one of its own
/// (`Uint8List.fromList(const <int>[0])`).
@immutable
class DartExpressionSerializer extends Equatable {
  const DartExpressionSerializer({required this.isConstContext});

  /// For a destination that is already a constant context: an enclosing
  /// `const` declaration, a parameter default, or inside another `const`
  /// expression. No keyword is written; one would be `unnecessary_const`.
  static const constContext = DartExpressionSerializer(isConstContext: true);

  /// For a destination that evaluates at runtime, such as the right-hand
  /// side of a `??`. A `const` keyword is written wherever it turns an
  /// allocation into a compile-time constant.
  static const runtimeContext = DartExpressionSerializer(
    isConstContext: false,
  );

  final bool isConstContext;

  /// The Dart source for [expression].
  ///
  /// Nothing wraps the outermost expression, so it is serialized at the
  /// loosest level.
  String serialize(DartExpression expression) =>
      _serializeAt(expression, DartPrecedence.throw_);

  /// [serialize], parenthesizing when [expression] binds looser than the
  /// position it is landing in requires.
  ///
  /// A written `const` keyword needs no accounting here: `const Foo(1)` is
  /// a primary, so `const Foo(1).bar` already means `(const Foo(1)).bar`.
  String _serializeAt(DartExpression expression, DartPrecedence minimum) {
    final source = _serializeBare(expression);
    return expression.precedence.index < minimum.index ? '($source)' : source;
  }

  String _serializeBare(DartExpression expression) {
    // A keyword written here (or a context inherited from above) makes
    // every child a constant context.
    final children = isConstContext || expression.canBeConst
        ? constContext
        : runtimeContext;
    return switch (expression) {
      // `const 5` and `const UserRole.admin` are syntax errors, so these
      // two arms never offer the keyword — that rule is expressed by the
      // shape of this switch rather than by a predicate.
      DartLiteral(:final value) =>
        value is String ? quoteString(value) : '$value',
      DartStaticMember(:final type, :final name) => '$type.$name',
      DartIdentifier(:final name) => name,
      // A call and a closure both evaluate at runtime, so neither can
      // carry the keyword; their children serialize in whatever context
      // reaches them.
      DartMethodCall(
        :final target,
        :final name,
        :final typeArguments,
        :final arguments,
        :final isNullAware,
      ) =>
        '${children._serializeAt(target, DartPrecedence.postfix)}'
            '${isNullAware ? '?.' : '.'}$name'
            '${_typeArgumentList(typeArguments)}'
            '(${arguments.map(children.serialize).join(', ')})',
      DartPropertyAccess(:final target, :final name, :final isNullAware) =>
        '${children._serializeAt(target, DartPrecedence.postfix)}'
            '${isNullAware ? '?.' : '.'}$name',
      DartFunctionCall(:final name, :final arguments) =>
        '$name(${arguments.map(children.serialize).join(', ')})',
      DartIndex(:final target, :final index) =>
        '${children._serializeAt(target, DartPrecedence.postfix)}'
            '[${children.serialize(index)}]',
      // `as` binds tighter than `??`, so its operand has to be at least a
      // cast itself; `(a ?? b) as T` is where this earns the parens.
      DartCast(:final operand, :final type) =>
        '${children._serializeAt(operand, DartPrecedence.cast)} as $type',
      // Elective parens, not required ones: `as` already binds tighter
      // than `??`, so `json['x'] as int? ?? 0` compiles and doesn't trip
      // `unnecessary_parenthesis`. It just reads badly — `? ??` runs two
      // unrelated question marks together — and handwritten Dart brackets
      // it. Asking for `postfix` rather than `cast` on the left is what
      // buys that.
      //
      // `??` is right-associative, so the right side may be another `??`
      // without parens.
      DartIfNull(:final value, :final ifNullValue) =>
        '${children._serializeAt(value, DartPrecedence.postfix)} ?? '
            '${children._serializeAt(ifNullValue, DartPrecedence.ifNull)}',
      DartThrow(:final value) => 'throw ${children.serialize(value)}',
      DartLambda(:final parameters, :final body) =>
        '(${parameters.join(', ')}) => ${children.serialize(body)}',
      DartListLiteral(:final elementType, :final elements) => _maybeConst(
        expression,
        '${elementType == null ? '' : '<$elementType>'}'
        '[${elements.map(children.serialize).join(', ')}]',
      ),
      DartMapLiteral(:final keyType, :final valueType, :final entries) =>
        _maybeConst(expression, () {
          final typeArguments = keyType == null || valueType == null
              ? ''
              : '<$keyType, $valueType>';
          final rendered = entries.map(children._serializeEntry);
          return '$typeArguments{${rendered.join(', ')}}';
        }()),
      DartInvocation(
        :final type,
        :final constructorName,
        :final arguments,
        :final namedArguments,
      ) =>
        _maybeConst(expression, () {
          final target = constructorName == null
              ? '$type'
              : '$type.$constructorName';
          final rendered = [
            ...arguments.map(children.serialize),
            ...namedArguments.entries.map(
              (entry) => '${entry.key}: ${children.serialize(entry.value)}',
            ),
          ];
          return '$target(${rendered.join(', ')})';
        }()),
    };
  }

  String _serializeEntry(DartMapEntry entry) =>
      '${serialize(entry.key)}: ${serialize(entry.value)}';

  /// Prefixes `const` when the destination is not already constant and the
  /// keyword buys a compile-time constant. Only called from the arms whose
  /// node kind can legally carry it.
  String _maybeConst(DartExpression expression, String source) =>
      !isConstContext && expression.canBeConst ? 'const $source' : source;

  /// `<A, B>`, or empty when there are none to write.
  static String _typeArgumentList(List<DartType> typeArguments) =>
      typeArguments.isEmpty ? '' : '<${typeArguments.join(', ')}>';

  @override
  List<Object?> get props => [isConstContext];
}

/// A call to a top-level function: `call('jsonDecode', [body])`.
///
/// The free-function counterpart to [DartTypeExpressions.construct], and
/// here for the same reason: so a call site reads like the Dart it emits,
/// and so the two kinds of call look alike where a branch picks between
/// them.
///
/// A function rather than an extension on `String`: an extension member
/// named `call` would make every `String` implicitly invocable, and any
/// other name reads worse than this does.
DartExpression call(String name, [List<DartExpression> arguments = const []]) =>
    DartFunctionCall(name: name, arguments: arguments);

/// Expression builders for the forms that are *rooted at a type name* —
/// `Foo(...)`, `Uri.parse(...)`, `UserRole.admin` — so a call site reads
/// like the Dart it emits.
///
/// Collection literals are deliberately absent: `<int>[0]` is rooted at
/// the bracket with the type as an argument, so `DartType.int_.listOf(...)`
/// would read as if it built the *type* `List<int>` (which
/// [DartType.list] does). Build those with [DartListLiteral] /
/// [DartMapLiteral] directly.
///
/// Also deliberately an extension declared here rather than methods on
/// [DartType]: the type model is the lower layer, imported by plenty of
/// code that never builds an expression. This is the seam between the two,
/// and it lives on the expression side.
extension DartTypeExpressions on DartType {
  /// An invocation whose result is never constant — a factory, a parse
  /// (`Uri.parse('...')`), or a constructor with a body.
  ///
  /// The unmarked name is the non-const one on purpose. The two failure
  /// directions are not symmetric: reaching for this when
  /// [constConstruct] would do only costs a `const`, while the reverse
  /// emits `const Foo(...)` around a non-constant, which doesn't compile.
  DartExpression construct(
    List<DartExpression> arguments, {
    String? name,
  }) => DartInvocation(
    type: this,
    constructorName: name,
    arguments: arguments,
    isConstConstructor: false,
  );

  /// An invocation of a constructor *declared* `const`, so the result is
  /// constant when its arguments are. Every constructor the generator
  /// emits for a model is `const` (#253), as are `Date` and the pod
  /// newtypes.
  DartExpression constConstruct(
    List<DartExpression> arguments, {
    String? name,
  }) => DartInvocation(
    type: this,
    constructorName: name,
    arguments: arguments,
    isConstConstructor: true,
  );

  /// A static member reference on this type: `UserRole.admin`.
  DartExpression member(String name) =>
      DartStaticMember(type: this, name: name);
}

/// A literal `String`, `num`, `bool`, or `null`.
///
/// Holds the real Dart value, not its rendered form, so the value stays
/// available to callers that want to reason about it. Numbers render through
/// `num.toString()`, which is where the `int`/`double` distinction lives:
/// `DartLiteral(5)` is `5` and `DartLiteral(5.0)` is `5.0`. Pick the right
/// one at construction.
class DartLiteral extends DartExpression {
  const DartLiteral(this.value);

  /// The literal's value: a `String`, `num`, `bool`, or `null`.
  final Object? value;

  /// Literals are always constant.
  @override
  bool get canBeConst => true;

  @override
  DartPrecedence get precedence => DartPrecedence.primary;

  // Includes the runtime type because `5 == 5.0` in Dart, but `5` and `5.0`
  // are different literals — equality here has to agree with [toString].
  @override
  List<Object?> get props => [value, value.runtimeType];
}

/// A list literal, e.g. `<int>[0]` or `[]`.
class DartListLiteral extends DartExpression {
  const DartListLiteral({required this.elementType, required this.elements});

  /// A list literal with no type argument, e.g. `[]` — the elements (or the
  /// context it lands in) infer it. Mirrors [DartMapLiteral.untyped].
  const DartListLiteral.untyped(this.elements) : elementType = null;

  /// The empty, untyped list literal `[]` — common enough as a default
  /// value to be worth naming.
  static const empty = DartListLiteral.untyped([]);

  /// The element type argument, or `null` to omit the `<T>`. An empty
  /// default (`const []`) is written untyped because the surrounding
  /// declaration already pins the type.
  final DartType? elementType;

  final List<DartExpression> elements;

  /// A list literal is constant when every element is.
  @override
  bool get canBeConst => elements.every((element) => element.canBeConst);

  @override
  DartPrecedence get precedence => DartPrecedence.primary;

  @override
  List<Object?> get props => [elementType, elements];
}

/// One `key: value` pair in a [DartMapLiteral].
@immutable
class DartMapEntry extends Equatable {
  const DartMapEntry(this.key, this.value);

  final DartExpression key;
  final DartExpression value;

  bool get canBeConst => key.canBeConst && value.canBeConst;

  @override
  List<Object?> get props => [key, value];
}

/// A map literal, e.g. `{'key': 'example'}` or `<String, dynamic>{}`.
class DartMapLiteral extends DartExpression {
  const DartMapLiteral({
    required this.keyType,
    required this.valueType,
    this.entries = const [],
  });

  /// A map literal with no type arguments, e.g. `{'key': 'example'}` —
  /// its entries infer them.
  const DartMapLiteral.untyped(this.entries) : keyType = null, valueType = null;

  /// The key type argument, or `null` to omit the `<K, V>` entirely and let
  /// the literal's own entries infer it.
  final DartType? keyType;

  /// The value type argument. `null` iff [keyType] is `null`.
  final DartType? valueType;

  final List<DartMapEntry> entries;

  /// A map literal is constant when every key and value is.
  @override
  bool get canBeConst => entries.every((entry) => entry.canBeConst);

  @override
  DartPrecedence get precedence => DartPrecedence.primary;

  @override
  List<Object?> get props => [keyType, valueType, entries];
}

/// A bare identifier: a parameter, local, or field name (`json`, `e`,
/// `value`).
///
/// Modeled rather than spliced as text so consumers can ask what an
/// expression *is* instead of matching `^[a-zA-Z_$][\w$]*$` against
/// rendered source.
class DartIdentifier extends DartExpression {
  const DartIdentifier(this.name);

  final String name;

  /// A reference to a variable is not a constant expression, even when the
  /// variable happens to hold one.
  @override
  bool get canBeConst => false;

  @override
  DartPrecedence get precedence => DartPrecedence.primary;

  @override
  List<Object?> get props => [name];
}

/// A method call on a target: `value.toJson()`, `items?.map(f).toList()`.
///
/// Chains by nesting — the target of one call is another call — so
/// `x.map(f).toList()` needs no special support.
class DartMethodCall extends DartExpression {
  const DartMethodCall({
    required this.target,
    required this.name,
    this.typeArguments = const [],
    this.arguments = const [],
    this.isNullAware = false,
  });

  /// The receiver the method is called on.
  final DartExpression target;

  final String name;

  /// Explicit type arguments: the `<Foo>` in `.map<Foo>(...)` and
  /// `.cast<Foo>()`. Written out rather than inferred because the target
  /// is a `List<dynamic>` off the wire, where inference would land on
  /// `dynamic`.
  final List<DartType> typeArguments;

  final List<DartExpression> arguments;

  /// Whether to call through `?.` rather than `.`, so a null target short
  /// circuits to null instead of throwing.
  final bool isNullAware;

  /// A method call runs at runtime; no invocation of one is constant.
  @override
  bool get canBeConst => false;

  @override
  DartPrecedence get precedence => DartPrecedence.postfix;

  @override
  List<Object?> get props => [
    target,
    name,
    typeArguments,
    arguments,
    isNullAware,
  ];
}

/// A call to a top-level function: `jsonDecode(json)`,
/// `maybeParseDateTime(v)`.
///
/// Distinct from [DartInvocation], which is rooted at a [DartType]. The
/// functions this models are the generator's own `model_helpers.dart`
/// entries plus `dart:convert`'s `jsonDecode` — free functions with no
/// enclosing type to name.
///
/// The name is a plain `String` because these are fixed, known functions;
/// there is no question a consumer asks about one beyond which it is.
class DartFunctionCall extends DartExpression {
  const DartFunctionCall({required this.name, this.arguments = const []});

  final String name;

  final List<DartExpression> arguments;

  /// The generator emits no `const` functions, so a call is never constant.
  @override
  bool get canBeConst => false;

  @override
  DartPrecedence get precedence => DartPrecedence.postfix;

  @override
  List<Object?> get props => [name, arguments];
}

/// An index read: `json['name']`.
class DartIndex extends DartExpression {
  const DartIndex({required this.target, required this.index});

  final DartExpression target;

  final DartExpression index;

  /// `const` collections can be indexed in a constant expression, but the
  /// generator only indexes the runtime JSON map.
  @override
  bool get canBeConst => false;

  @override
  DartPrecedence get precedence => DartPrecedence.postfix;

  @override
  List<Object?> get props => [target, index];
}

/// A cast: `json['x'] as String?`.
class DartCast extends DartExpression {
  const DartCast({required this.operand, required this.type});

  final DartExpression operand;

  final DartType type;

  /// A cast of a constant is itself a constant expression, but the
  /// generator only ever casts a runtime JSON value, so claiming const here
  /// would be untestable. False until something needs otherwise.
  @override
  bool get canBeConst => false;

  @override
  DartPrecedence get precedence => DartPrecedence.cast;

  @override
  List<Object?> get props => [operand, type];
}

/// A null-coalescing expression: `json['x'] as int? ?? 0`.
class DartIfNull extends DartExpression {
  const DartIfNull({required this.value, required this.ifNullValue});

  /// The left side, used when it is not null.
  final DartExpression value;

  /// The right side, evaluated only when [value] is null.
  final DartExpression ifNullValue;

  /// `??` evaluates at runtime — it is not a constant expression even when
  /// both sides could be.
  @override
  bool get canBeConst => false;

  @override
  DartPrecedence get precedence => DartPrecedence.ifNull;

  @override
  List<Object?> get props => [value, ifNullValue];
}

/// A throw expression: `throw UnimplementedError('...')`.
///
/// Grammatically an expression in Dart, which is what lets it stand in for
/// a value the generator cannot produce — the no-JSON schemas (`void`,
/// binary) parse to one.
class DartThrow extends DartExpression {
  const DartThrow(this.value);

  final DartExpression value;

  @override
  bool get canBeConst => false;

  @override
  DartPrecedence get precedence => DartPrecedence.throw_;

  @override
  List<Object?> get props => [value];
}

/// A property access: `entry.value`, `response.body`.
///
/// Distinct from [DartMethodCall] because it emits no parentheses, and
/// from [DartStaticMember] because the target is an expression rather than
/// a type.
class DartPropertyAccess extends DartExpression {
  const DartPropertyAccess({
    required this.target,
    required this.name,
    this.isNullAware = false,
  });

  final DartExpression target;

  final String name;

  /// Whether to read through `?.` rather than `.`.
  final bool isNullAware;

  /// Reading a property runs at runtime; the result is not a constant.
  @override
  bool get canBeConst => false;

  @override
  DartPrecedence get precedence => DartPrecedence.postfix;

  @override
  List<Object?> get props => [target, name, isNullAware];
}

/// An expression-bodied lambda: `(e) => e.toJson()`.
///
/// Only the arrow form is modeled, which is all the generator emits.
class DartLambda extends DartExpression {
  const DartLambda({required this.parameters, required this.body});

  /// Parameter names, in order. Untyped — the generator relies on
  /// inference at every site that emits one.
  final List<String> parameters;

  final DartExpression body;

  /// A closure is never a constant expression.
  @override
  bool get canBeConst => false;

  @override
  DartPrecedence get precedence => DartPrecedence.lambda;

  @override
  List<Object?> get props => [parameters, body];
}

/// A constructor invocation or static method call: `Foo(1)`,
/// `Uri.parse('...')`, `Uint8List.fromList(<int>[0])`.
class DartInvocation extends DartExpression {
  // Unlike the `Render*` / `Resolved*` / `Schema*` pipeline types, these
  // parameters default rather than being `required`. Nothing threads
  // through three layers here — an expression is built and rendered in
  // one place — and most invocations are an unnamed constructor with
  // only positional arguments, so requiring `constructorName: null,
  // namedArguments: {}` at every site is noise that hides the fields
  // that do vary. Same call for the same reason as [DartType].
  const DartInvocation({
    required this.type,
    required this.isConstConstructor,
    this.constructorName,
    this.arguments = const [],
    this.namedArguments = const {},
  });

  /// The type being constructed (or whose static member is being called).
  final DartType type;

  /// The named constructor or static method, or `null` for the unnamed
  /// constructor.
  final String? constructorName;

  /// Positional arguments, rendered before [namedArguments].
  final List<DartExpression> arguments;

  /// Named arguments, rendered in iteration order. Callers own the ordering
  /// (required-first, matching the generated constructor's signature).
  final Map<String, DartExpression> namedArguments;

  /// Whether the invoked constructor is *declared* `const` — a fact only the
  /// caller knows, and the input to [canBeConst] rather than a synonym for
  /// it. False for factories and anything that computes at runtime
  /// (`Uri.parse`, `DateTime.utc`, `Uint8List.fromList`), and for a
  /// generated constructor with a validating body.
  ///
  /// A const constructor invoked with an argument that cannot be const
  /// does not itself qualify, which is what the fold in [canBeConst]
  /// works out.
  //
  // TODO(eseidel): Model the constructor itself, not a bool about it.
  //
  // `[type] + [constructorName] + [isConstConstructor]` is a
  // `DartConstructor` spelled as three loose fields, and const-ness is the
  // one part callers have to supply by hand — which is why
  // [DartTypeExpressions] needs a `construct` / `constConstruct` pair at
  // all. With a real constructor entity there is one `invoke(...)`, and
  // const-ness comes from the declaration being invoked.
  //
  // The bigger win is upstream: for a generated model the answer is
  // `RenderObject.canBeConst(context)`, which is consulted *twice* today —
  // once by the template that emits `const Foo(...)` and once here, from
  // the example builder. Two readers of one fact, kept in agreement by
  // hand, is the same coupling this IR exists to remove. A schema should
  // hand out the constructor it is going to emit, and both should use it.
  final bool isConstConstructor;

  @override
  bool get canBeConst =>
      isConstConstructor &&
      arguments.every((argument) => argument.canBeConst) &&
      namedArguments.values.every((argument) => argument.canBeConst);

  @override
  DartPrecedence get precedence => DartPrecedence.postfix;

  @override
  List<Object?> get props => [
    type,
    constructorName,
    arguments,
    namedArguments,
    isConstConstructor,
  ];
}

/// A static member reference, e.g. `UserRole.admin`.
///
/// Distinct from a zero-argument [DartInvocation] because it is not a call:
/// `const UserRole.admin` is a syntax error, which is exactly the bug that
/// motivated this IR.
class DartStaticMember extends DartExpression {
  const DartStaticMember({required this.type, required this.name});

  final DartType type;

  /// The member name, e.g. an enum member.
  final String name;

  /// Enum members and other static const members are constant. This node is
  /// only used for members that are; a static getter would not be.
  @override
  bool get canBeConst => true;

  @override
  DartPrecedence get precedence => DartPrecedence.postfix;

  @override
  List<Object?> get props => [type, name];
}
