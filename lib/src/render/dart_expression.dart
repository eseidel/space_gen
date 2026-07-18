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
/// [toString] is the single rendering source of truth, again matching
/// [DartType]. Expressions are always rendered bare: no `const` keyword is
/// ever emitted, because the only consumer today is a variable declaration
/// where const-ness is spent on the declaration keyword (`const instance =
/// Foo(...)`). That covers the whole tree at once — a const declaration is a
/// const context, so nested constructors and collection literals become
/// constant without their own keyword, and an inner `const` would trip
/// `unnecessary_const`.
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

  /// The rendered Dart source for this expression, never `const`-prefixed.
  @override
  String toString();
}

/// Expression builders that start from the type they produce, so a call
/// site reads roughly like the Dart it emits:
/// `DartType.uri.constructAtRuntime(name: 'parse', arguments: [...])`.
///
/// Deliberately an extension declared here rather than methods on
/// [DartType]: the type model shouldn't have to know about expressions
/// (it is the lower layer, and is imported by code that never builds one).
/// This is the seam between the two, and it lives on the expression side.
extension DartTypeExpressions on DartType {
  /// An invocation of a constructor declared `const` — `Foo(1)`,
  /// `Foo.named(a: 1)` — so the result is constant when its arguments are.
  ///
  /// Every constructor the generator emits for a model is `const` (#253),
  /// so this is the common case. When unsure, prefer
  /// [constructAtRuntime]: under-claiming only costs a `const`, while
  /// over-claiming emits `const Foo(...)` around a non-constant, which
  /// doesn't compile.
  DartExpression construct({
    String? name,
    List<DartExpression> arguments = const [],
    Map<String, DartExpression> namedArguments = const {},
  }) => DartInvocation(
    type: this,
    constructorName: name,
    arguments: arguments,
    namedArguments: namedArguments,
    isConstConstructor: true,
  );

  /// An invocation that computes at runtime — `Uri.parse('...')`,
  /// `Uint8List.fromList([...])` — and so is never constant.
  DartExpression constructAtRuntime({
    String? name,
    List<DartExpression> arguments = const [],
    Map<String, DartExpression> namedArguments = const {},
  }) => DartInvocation.runtime(
    type: this,
    constructorName: name,
    arguments: arguments,
    namedArguments: namedArguments,
  );

  /// A list literal of this element type: `<int>[0]`.
  DartExpression listOf(Iterable<DartExpression> elements) =>
      DartListLiteral(elementType: this, elements: elements.toList());

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

  @override
  String toString() {
    final value = this.value;
    // Strings quote through the shared helper, which owns quote style and
    // escaping (`$`, `'`, newlines).
    return value is String ? quoteString(value) : '$value';
  }

  // Includes the runtime type because `5 == 5.0` in Dart, but `5` and `5.0`
  // are different literals — equality here has to agree with [toString].
  @override
  List<Object?> get props => [value, value.runtimeType];
}

/// A list literal, e.g. `<int>[0]`.
class DartListLiteral extends DartExpression {
  const DartListLiteral({
    required this.elementType,
    required this.elements,
  });

  /// The element type argument. Always written — an untyped `[...]` would
  /// infer from context, which generated code shouldn't rely on.
  final DartType elementType;

  final List<DartExpression> elements;

  /// A list literal is constant when every element is.
  @override
  bool get isConst => elements.every((element) => element.isConst);

  @override
  String toString() => '<$elementType>[${elements.join(', ')}]';

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
  String toString() => '$key: $value';

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
  String toString() {
    final keyType = this.keyType;
    final valueType = this.valueType;
    final typeArguments = keyType == null || valueType == null
        ? ''
        : '<$keyType, $valueType>';
    return '$typeArguments{${entries.join(', ')}}';
  }

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

  /// An invocation that computes its value at runtime, and so is never a
  /// constant expression however constant its arguments are: a factory
  /// (`Uint8List.fromList`), a parse (`Uri.parse`, `UriTemplate`), or a
  /// generated constructor with a validating body.
  const DartInvocation.runtime({
    required this.type,
    this.constructorName,
    this.arguments = const [],
    this.namedArguments = const {},
  }) : isConstConstructor = false;

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
  final bool isConstConstructor;

  @override
  bool get isConst =>
      isConstConstructor &&
      arguments.every((argument) => argument.isConst) &&
      namedArguments.values.every((argument) => argument.isConst);

  @override
  String toString() {
    final name = constructorName;
    final target = name == null ? '$type' : '$type.$name';
    final rendered = [
      ...arguments.map((argument) => '$argument'),
      ...namedArguments.entries.map((entry) => '${entry.key}: ${entry.value}'),
    ];
    return '$target(${rendered.join(', ')})';
  }

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
  String toString() => '$type.$name';

  @override
  List<Object?> get props => [type, name];
}
