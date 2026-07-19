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
