import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksCreateSuiteRequest {
  const ChecksCreateSuiteRequest({required this.headSha});

  /// Converts a `Map<String, dynamic>` to a [ChecksCreateSuiteRequest].
  factory ChecksCreateSuiteRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChecksCreateSuiteRequest',
      json,
      () => ChecksCreateSuiteRequest(headSha: json['head_sha'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksCreateSuiteRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ChecksCreateSuiteRequest.fromJson(json);
  }

  /// The sha of the head commit.
  final String headSha;

  /// Converts a [ChecksCreateSuiteRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'head_sha': headSha};
  }

  @override
  int get hashCode => headSha.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksCreateSuiteRequest && headSha == other.headSha;
  }
}
