// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GitUpdateRefRequest {
  const GitUpdateRefRequest({required this.sha, this.force = false});

  /// Converts a `Map<String, dynamic>` to a [GitUpdateRefRequest].
  factory GitUpdateRefRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitUpdateRefRequest',
      json,
      () => GitUpdateRefRequest(
        sha: json['sha'] as String,
        force: (json['force'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitUpdateRefRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitUpdateRefRequest.fromJson(json);
  }

  /// The SHA1 value to set this reference to
  final String sha;

  /// Indicates whether to force the update or to make sure the update is a
  /// fast-forward update. Leaving this out or setting it to `false` will make
  /// sure you're not overwriting work.
  final bool force;

  /// Converts a [GitUpdateRefRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sha': sha, 'force': force};
  }

  @override
  int get hashCode => Object.hashAll([sha, force]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitUpdateRefRequest &&
        sha == other.sha &&
        force == other.force;
  }
}
