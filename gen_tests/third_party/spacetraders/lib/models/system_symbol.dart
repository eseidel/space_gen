import 'package:spacetraders/api_exception.dart';

/// The symbol of the system.
extension type const SystemSymbol._(String value) {
  SystemSymbol(this.value) {
    value.validate(minLength: 1);
  }

  factory SystemSymbol.fromJson(String json) => SystemSymbol(json);

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SystemSymbol? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SystemSymbol.fromJson(json);
  }

  String toJson() => value;
}
