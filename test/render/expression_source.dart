import 'package:space_gen/src/render/dart_expression.dart';

/// Test-only sugar over [DartExpressionSerializer], so assertions read
/// `expr.source` instead of naming a serializer at every call.
///
/// Production code names the serializer explicitly: which context applies
/// is a decision about the destination, and picking it deliberately is the
/// whole point of separating rendering from the tree.
extension ExpressionSource on DartExpression {
  /// Source for a destination that is already a constant context.
  String get source =>
      DartExpressionSerializer.serialize(this, isConstContext: true);

  /// Source for a destination that evaluates at runtime.
  String get runtimeSource =>
      DartExpressionSerializer.serialize(this, isConstContext: false);
}
