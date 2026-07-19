// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProtectedBranchRequiredSignatures {
  const ProtectedBranchRequiredSignatures({
    required this.url,
    required this.enabled,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ProtectedBranchRequiredSignatures].
  factory ProtectedBranchRequiredSignatures.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProtectedBranchRequiredSignatures',
      json,
      () => ProtectedBranchRequiredSignatures(
        url: Uri.parse(json['url'] as String),
        enabled: json['enabled'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProtectedBranchRequiredSignatures? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProtectedBranchRequiredSignatures.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/octocat/Hello-World/branches/master/protection/required_signatures'`
  final Uri url;

  /// Example: `true`
  final bool enabled;

  /// Converts a [ProtectedBranchRequiredSignatures]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'url': url.toString(), 'enabled': enabled};
  }

  @override
  int get hashCode => Object.hashAll([url, enabled]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProtectedBranchRequiredSignatures &&
        url == other.url &&
        enabled == other.enabled;
  }
}
