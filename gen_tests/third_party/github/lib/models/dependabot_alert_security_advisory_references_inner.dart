import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_alert_security_advisory_references_inner}
/// A link to additional advisory information.
/// {@endtemplate}
@immutable
class DependabotAlertSecurityAdvisoryReferencesInner {
  /// {@macro dependabot_alert_security_advisory_references_inner}
  const DependabotAlertSecurityAdvisoryReferencesInner({required this.url});

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotAlertSecurityAdvisoryReferencesInner].
  factory DependabotAlertSecurityAdvisoryReferencesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotAlertSecurityAdvisoryReferencesInner',
      json,
      () => DependabotAlertSecurityAdvisoryReferencesInner(
        url: Uri.parse(json['url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotAlertSecurityAdvisoryReferencesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertSecurityAdvisoryReferencesInner.fromJson(json);
  }

  /// The URL of the reference.
  final Uri url;

  /// Converts a [DependabotAlertSecurityAdvisoryReferencesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'url': url.toString()};
  }

  @override
  int get hashCode => url.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotAlertSecurityAdvisoryReferencesInner &&
        url == other.url;
  }
}
