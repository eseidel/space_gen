import 'package:github/model_helpers.dart';
import 'package:github/models/dependabot_alert_security_advisory_identifiers_inner_type.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_alert_security_advisory_identifiers_inner}
/// An advisory identifier.
/// {@endtemplate}
@immutable
class DependabotAlertSecurityAdvisoryIdentifiersInner {
  /// {@macro dependabot_alert_security_advisory_identifiers_inner}
  const DependabotAlertSecurityAdvisoryIdentifiersInner({
    required this.type,
    required this.value,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotAlertSecurityAdvisoryIdentifiersInner].
  factory DependabotAlertSecurityAdvisoryIdentifiersInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotAlertSecurityAdvisoryIdentifiersInner',
      json,
      () => DependabotAlertSecurityAdvisoryIdentifiersInner(
        type: DependabotAlertSecurityAdvisoryIdentifiersInnerType.fromJson(
          json['type'] as String,
        ),
        value: json['value'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotAlertSecurityAdvisoryIdentifiersInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertSecurityAdvisoryIdentifiersInner.fromJson(json);
  }

  /// The type of advisory identifier.
  final DependabotAlertSecurityAdvisoryIdentifiersInnerType type;

  /// The value of the advisory identifer.
  final String value;

  /// Converts a [DependabotAlertSecurityAdvisoryIdentifiersInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'value': value};
  }

  @override
  int get hashCode => Object.hashAll([type, value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotAlertSecurityAdvisoryIdentifiersInner &&
        type == other.type &&
        value == other.value;
  }
}
