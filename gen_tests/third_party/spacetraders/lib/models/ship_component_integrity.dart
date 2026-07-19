import 'package:spacetraders/api_exception.dart';

/// The overall integrity of the component, which determines the performance of
/// the component. A value of 0 indicates that the component is almost
/// completely degraded, while a value of 1 indicates that the component is in
/// near perfect condition. The integrity of the component is non-repairable,
/// and represents permanent wear over time.
extension type const ShipComponentIntegrity._(double value) {
  ShipComponentIntegrity(this.value) {
    value
      ..validateMaximum(1.0)
      ..validateMinimum(0.0);
  }

  factory ShipComponentIntegrity.fromJson(num json) =>
      ShipComponentIntegrity(json.toDouble());

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipComponentIntegrity? maybeFromJson(num? json) {
    if (json == null) {
      return null;
    }
    return ShipComponentIntegrity.fromJson(json);
  }

  double toJson() => value;
}
