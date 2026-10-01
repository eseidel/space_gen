// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:spacetraders/api_exception.dart';

/// The repairable condition of a component. A value of 0 indicates the
/// component needs significant repairs, while a value of 1 indicates the
/// component is in near perfect condition. As the condition of a component is
/// repaired, the overall integrity of the component decreases.
extension type const ShipComponentCondition._(double value) {
  ShipComponentCondition(this.value) {
    value.validate(min: 0.0, max: 1.0);
  }

  factory ShipComponentCondition.fromJson(num json) =>
      ShipComponentCondition(json.toDouble());

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipComponentCondition? maybeFromJson(num? json) {
    if (json == null) {
      return null;
    }
    return ShipComponentCondition.fromJson(json);
  }

  double toJson() => value;
}
