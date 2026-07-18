import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// A synthesized example expression for a schema, plus whether that
/// expression is a compile-time constant.
///
/// Generated round-trip tests construct one instance per schema
/// (`final instance = <exampleValue>;`). Since #253 made model
/// constructors `const`, those constructions trip
/// `prefer_const_constructors` unless they are constant — but only when
/// every part of the expression really is const-able (`Uri.parse(...)`,
/// `DateTime.utc(...)` and a validating newtype's constructor are not).
///
/// [code] and [isConst] travel together deliberately. They are computed
/// by the same recursion over the render tree, so a composite's
/// const-ness can never disagree with the expression it was derived
/// from — a split into two parallel methods would have to mirror every
/// `null` bail-out ("no example possible") in lockstep, and a
/// disagreement emits a `const` declaration around a non-constant
/// initializer, which is a compile error in the generated package.
///
/// [code] is always the bare expression, never `const`-prefixed. The
/// single consumer is a variable declaration, so const-ness is spent on
/// the *declaration* keyword (`const instance = Foo(...)`) rather than
/// on the initializer. That covers the whole expression tree at once:
/// a const declaration is a const context, so nested constructors and
/// collection literals become constant without their own keyword (an
/// inner `const` would trip `unnecessary_const`), and it avoids
/// `prefer_const_declarations` firing on a `final` with a constant
/// initializer. It also sidesteps the fact that `const` is only legal
/// before a constructor call or collection literal — `const
/// UserRole.admin` and `const 'text'` are syntax errors, so prefixing
/// the initializer could not have worked uniformly anyway.
@immutable
class ExampleValue extends Equatable {
  const ExampleValue(this.code, {required this.isConst});

  /// The Dart expression, without any `const` prefix.
  final String code;

  /// Whether [code] is a compile-time constant expression, and so
  /// whether it can be assigned to a `const` variable and used inside
  /// an enclosing constant expression.
  final bool isConst;

  @override
  List<Object?> get props => [code, isConst];

  @override
  String toString() => 'ExampleValue($code, isConst: $isConst)';
}
