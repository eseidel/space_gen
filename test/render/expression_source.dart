import 'package:space_gen/src/render/dart_expression.dart';

/// Test-only sugar over [serializeExpression], so assertions read
/// `expr.source` instead of naming a destination at every call.
///
/// Production code names the destination explicitly: which context applies
/// is a decision about where the text lands, and picking it deliberately is
/// the whole point of separating rendering from the tree.
extension ExpressionSource on DartExpression {
  /// Source for a destination that is already a constant context.
  String get source => serializeExpression(this, isConstContext: true);

  /// Source for a destination that evaluates at runtime.
  String get runtimeSource => serializeExpression(this, isConstContext: false);
}
