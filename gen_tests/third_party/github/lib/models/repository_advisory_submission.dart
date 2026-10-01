// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryAdvisorySubmission {
  const RepositoryAdvisorySubmission({required this.accepted});

  /// Converts a `Map<String, dynamic>` to a [RepositoryAdvisorySubmission].
  factory RepositoryAdvisorySubmission.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryAdvisorySubmission',
      json,
      () => RepositoryAdvisorySubmission(accepted: json['accepted'] as bool),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisorySubmission? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisorySubmission.fromJson(json);
  }

  /// Whether a private vulnerability report was accepted by the repository's
  /// administrators.
  final bool accepted;

  /// Converts a [RepositoryAdvisorySubmission] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'accepted': accepted};
  }

  @override
  int get hashCode => accepted.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisorySubmission && accepted == other.accepted;
  }
}
