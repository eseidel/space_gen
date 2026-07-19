import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateTagProtectionRequest {
  const ReposCreateTagProtectionRequest({required this.pattern});

  /// Converts a `Map<String, dynamic>` to a [ReposCreateTagProtectionRequest].
  factory ReposCreateTagProtectionRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateTagProtectionRequest',
      json,
      () => ReposCreateTagProtectionRequest(pattern: json['pattern'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateTagProtectionRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateTagProtectionRequest.fromJson(json);
  }

  /// An optional glob pattern to match against when enforcing tag protection.
  final String pattern;

  /// Converts a [ReposCreateTagProtectionRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'pattern': pattern};
  }

  @override
  int get hashCode => pattern.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateTagProtectionRequest && pattern == other.pattern;
  }
}
