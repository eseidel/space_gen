import 'package:github/models/code_security_default_configurations_inner.dart';

/// A list of default code security configurations
extension type const CodeSecurityDefaultConfigurations._(
  List<CodeSecurityDefaultConfigurationsInner> value
) implements List<CodeSecurityDefaultConfigurationsInner> {
  const CodeSecurityDefaultConfigurations(this.value);

  factory CodeSecurityDefaultConfigurations.fromJson(List<dynamic> json) =>
      CodeSecurityDefaultConfigurations(
        json
            .map<CodeSecurityDefaultConfigurationsInner>(
              (e) => CodeSecurityDefaultConfigurationsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      );

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSecurityDefaultConfigurations? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSecurityDefaultConfigurations.fromJson(json);
  }

  List<dynamic> toJson() => value.map((e) => e.toJson()).toList();
}
