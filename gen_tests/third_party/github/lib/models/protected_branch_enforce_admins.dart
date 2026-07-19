import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProtectedBranchEnforceAdmins {
  const ProtectedBranchEnforceAdmins({
    required this.url,
    required this.enabled,
  });

  /// Converts a `Map<String, dynamic>` to a [ProtectedBranchEnforceAdmins].
  factory ProtectedBranchEnforceAdmins.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProtectedBranchEnforceAdmins',
      json,
      () => ProtectedBranchEnforceAdmins(
        url: Uri.parse(json['url'] as String),
        enabled: json['enabled'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchEnforceAdmins? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchEnforceAdmins.fromJson(json);
  }

  final Uri url;
  final bool enabled;

  /// Converts a [ProtectedBranchEnforceAdmins] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'url': url.toString(), 'enabled': enabled};
  }

  @override
  int get hashCode => Object.hashAll([url, enabled]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchEnforceAdmins &&
        url == other.url &&
        enabled == other.enabled;
  }
}
