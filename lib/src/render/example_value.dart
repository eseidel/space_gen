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
// TODO(eseidel): Replace `code` with a real expression IR.
//
// Carrying Dart code as a `String` is the same mistake `DartType`
// exists to fix, one layer up: we stopped writing `'$typeName?'` for
// types, but expressions are still built by concatenation. The tell is
// `isConst` — const-ness is a *derived* property of an expression's
// structure (a constructor invocation is const iff its constructor is
// const and every argument is), so with a tree it would be a computed
// getter instead of a field every composite has to thread by hand.
// Two bugs during this class's own development came from exactly that
// gap: `const` was emitted before an enum member (`const
// UserRole.admin` is a syntax error — a static member reference is not
// a constructor invocation), and const-ness was first attached to the
// initializer rather than the declaration. A tree answers both
// structurally.
//
// This isn't only about examples. `defaultValueString` is compared to
// `code` by *rendered text* in `RenderObject.exampleValue` — structural
// equality spelled as string equality — and `fromJsonExpression` /
// `toJsonExpression` plus the dispatch `caseExpression`s are all
// string-composed too. #255 (don't parenthesize a bare numeric cast)
// and #256 (drop redundant argument values) were string-level fixes to
// what are structural questions.
//
// The approach is settled: a small home-grown sealed IR, reusing
// `DartType` for type references, with `isConst` as an exhaustive
// switch rather than a stored field. `package:code_builder` was
// evaluated and rejected — its `Expression.isConst` is an authoring
// flag recorded at construction, not derived (it reports `false` for
// the literal `5` and `true` for the invalid `const Foo(Bar())`), and
// its tree is too lossy to recompute it. See `doc/dart_expression.md`
// for the full decision record; don't re-litigate it here.
@immutable
class ExampleValue extends Equatable {
  /// For expressions whose const-ness is *computed* — a composite
  /// inheriting from its children, or a newtype gated on whether the
  /// schema declares validations. Prefer [ExampleValue.constant] /
  /// [ExampleValue.notConst] when the answer is known outright.
  const ExampleValue(this.code, {required this.isConst});

  /// A constant expression: literals, enum members, and constructor
  /// calls whose arguments are all themselves constant.
  const ExampleValue.constant(this.code) : isConst = true;

  /// An expression that can never be constant — `Uri.parse(...)`,
  /// `DateTime.utc(...)`, `Uint8List.fromList(...)`, or a validating
  /// newtype constructor.
  const ExampleValue.notConst(this.code) : isConst = false;

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
