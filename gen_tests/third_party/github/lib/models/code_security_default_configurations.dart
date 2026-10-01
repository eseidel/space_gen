// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/models/code_security_default_configurations_inner.dart';

/// A list of default code security configurations
extension type const CodeSecurityDefaultConfigurations._(
  List<CodeSecurityDefaultConfigurationsInner> value
)
    implements List<CodeSecurityDefaultConfigurationsInner> {
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
