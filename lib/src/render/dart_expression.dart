import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:space_gen/src/render/dart_type.dart';
import 'package:space_gen/src/string.dart';

/// A Dart expression as structure rather than text.
///
/// The expression-level counterpart to [DartType], and for the same reason:
/// facts about an expression should be *derived* from what it is, not
/// recovered by inspecting rendered source. [isConst] is the motivating
/// case — a constructor invocation is constant iff its constructor is
/// `const` and every argument is constant, which is a fold over the tree
/// and not something a composite should have to thread by hand.
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

  /// Whether this is a compile-time constant expression, and so whether it
  /// can be assigned to a `const` variable and used inside an enclosing
  /// constant expression.
  ///
  /// Derived, never stored.
  bool get isConst;

  /// Debug form (`DartLiteral(5)`), not Dart source. Rendering goes
  /// through [DartExpressionSerializer] — an expression cannot serialize
  /// itself, because how it renders depends on where the text lands.
  @override
  bool get stringify => true;
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
  String serialize(DartExpression expression) {
    // A keyword written here (or a context inherited from above) makes
    // every child a constant context.
    final children = isConstContext || expression.isConst
        ? constContext
        : runtimeContext;
    return switch (expression) {
      // `const 5` and `const UserRole.admin` are syntax errors, so these
      // two arms never offer the keyword — that rule is expressed by the
      // shape of this switch rather than by a predicate.
      DartLiteral(:final value) =>
        value is String ? quoteString(value) : '$value',
      DartStaticMember(:final type, :final name) => '$type.$name',
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
      !isConstContext && expression.isConst ? 'const $source' : source;

  @override
  List<Object?> get props => [isConstContext];
}

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
  bool get isConst => true;

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
  bool get isConst => elements.every((element) => element.isConst);

  @override
  List<Object?> get props => [elementType, elements];
}

/// One `key: value` pair in a [DartMapLiteral].
@immutable
class DartMapEntry extends Equatable {
  const DartMapEntry(this.key, this.value);

  final DartExpression key;
  final DartExpression value;

  bool get isConst => key.isConst && value.isConst;

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
  bool get isConst => entries.every((entry) => entry.isConst);

  @override
  List<Object?> get props => [keyType, valueType, entries];
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
  /// caller knows. False for factories and anything that computes at runtime
  /// (`Uri.parse`, `DateTime.utc`, `Uint8List.fromList`), and for a
  /// generated constructor with a validating body.
  ///
  /// This is the input to [isConst], not a synonym for it: a const
  /// constructor invoked with a non-constant argument is not a constant
  /// expression.
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
  bool get isConst =>
      isConstConstructor &&
      arguments.every((argument) => argument.isConst) &&
      namedArguments.values.every((argument) => argument.isConst);

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
  bool get isConst => true;

  @override
  List<Object?> get props => [type, name];
}
