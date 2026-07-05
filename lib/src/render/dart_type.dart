import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// A structured Dart type: a base [name], optional [typeArguments], and
/// [isNullable]. The generator's own minimal type model so type logic
/// (rendering, nullability, common-type) is real structure instead of string
/// manipulation over type names.
///
/// This is deliberately small — just what the renderer needs today. It does
/// not yet model the type hierarchy (see [commonType]) or import provenance.
@immutable
class DartType extends Equatable {
  const DartType(
    this.name, {
    this.typeArguments = const [],
    this.isNullable = false,
  });

  /// A `List<T>` type. [element] defaults to `dynamic` (`List<dynamic>`).
  DartType.list([DartType? element])
    : name = 'List',
      typeArguments = [element ?? dynamic_],
      isNullable = false;

  /// A `Map<K, V>` type.
  DartType.map(DartType key, DartType value)
    : name = 'Map',
      typeArguments = [key, value],
      isNullable = false;

  /// The base identifier: `String`, `List`, `Map`, `DateTime`, or a generated
  /// class name. No type arguments, no trailing `?`.
  final String name;

  /// Type arguments for a generic type, e.g. `[DartType('String')]` for
  /// `List<String>` or `[DartType('String'), DartType('int')]` for
  /// `Map<String, int>`.
  final List<DartType> typeArguments;

  /// Whether the type is nullable (renders a trailing `?`).
  final bool isNullable;

  /// `dynamic` — the untyped escape hatch. Already nullable; never renders `?`.
  static const dynamic_ = DartType('dynamic');

  /// `Object?` — the nullable top type; the fallback when a set of types has
  /// no tighter common supertype.
  static const nullableObject = DartType('Object', isNullable: true);

  /// `void` — a schema with no value (e.g. an empty response body).
  static const void_ = DartType('void');

  /// `Uint8List` (`dart:typed_data`) — binary field types.
  static const uint8List = DartType('Uint8List');

  /// `DateTime` (`dart:core`) — `format: date` / `date-time` fields.
  static const dateTime = DartType('DateTime');

  /// `Uri` (`dart:core`) — `format: uri` fields.
  static const uri = DartType('Uri');

  /// `UriTemplate` (`package:uri`) — `format: uri-template` fields.
  //
  // TODO(eseidel): Unlike the other constants, this names a type from a
  // third-party package, not the Dart SDK. If DartType ever generalizes into a
  // project-agnostic type model, this project-specific constant should move out
  // of the core class (e.g. a space_gen-side constant, or built at the use
  // site) rather than living alongside the language-level types.
  static const uriTemplate = DartType('UriTemplate');

  /// The `String` type.
  static const string = DartType('String');

  /// The `bool` type.
  static const bool_ = DartType('bool');

  /// The `int` type.
  static const int_ = DartType('int');

  /// The `double` type.
  static const double_ = DartType('double');

  /// The `num` type.
  static const num_ = DartType('num');

  /// This type made nullable.
  DartType asNullable() => isNullable
      ? this
      : DartType(name, typeArguments: typeArguments, isNullable: true);

  /// This type made non-nullable.
  DartType asNonNullable() =>
      isNullable ? DartType(name, typeArguments: typeArguments) : this;

  /// The tightest [DartType] that soundly covers every type in [types].
  ///
  /// When they share one base type (ignoring nullability), that type — made
  /// nullable if any input was nullable. Otherwise [nullableObject]. `dynamic`
  /// and `Object` bases fall back to [nullableObject] rather than a redundant
  /// `dynamic?`, and an empty set is [nullableObject].
  ///
  // TODO(eseidel): This unifies by structural equality only; it does not know
  // the type hierarchy. Distinct types that share a real supertype (two
  // subclasses of one base, or generated enums that all implement `Enum`) fall
  // back to `Object?` even though a tighter common type exists.
  //
  // When we add a real least-upper-bound, the inheritance graph should live in
  // a separate type environment this consults (e.g. `commonType(types, graph)`
  // or `graph.leastUpperBound(a, b)`) — NOT as a `superType` field on
  // [DartType]. Keeping [DartType] a pure value expression keeps `==` simple
  // and avoids making every type reference a graph node (the same supertype
  // chain repeated on every occurrence, and cycles on recursive schemas like
  // `Node -> Node`). The graph isn't threaded through to the render context
  // yet.
  static DartType commonType(Iterable<DartType> types) {
    final list = types.toList();
    if (list.isEmpty) return nullableObject;
    final base = list.first.asNonNullable();
    final allSame = list.every((type) => type.asNonNullable() == base);
    if (allSame && base != dynamic_ && base.name != 'Object') {
      return list.any((type) => type.isNullable) ? base.asNullable() : base;
    }
    return nullableObject;
  }

  @override
  String toString() {
    final args = typeArguments.isEmpty ? '' : '<${typeArguments.join(', ')}>';
    // `dynamic` is already nullable; a trailing `?` on it is a lint.
    final suffix = isNullable && name != 'dynamic' ? '?' : '';
    return '$name$args$suffix';
  }

  @override
  List<Object?> get props => [name, typeArguments, isNullable];
}
