import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryAdvisoryCvss {
  RepositoryAdvisoryCvss({required this.vectorString, required this.score}) {
    score?.validate(min: 0.0, max: 10.0);
  }

  /// Converts a `Map<String, dynamic>` to a [RepositoryAdvisoryCvss].
  factory RepositoryAdvisoryCvss.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryAdvisoryCvss',
      json,
      () => RepositoryAdvisoryCvss(
        vectorString: checkedKey(json, 'vector_string') as String?,
        score: (checkedKey(json, 'score') as num?)?.toDouble(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryCvss? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryCvss.fromJson(json);
  }

  /// The CVSS vector.
  final String? vectorString;

  /// The CVSS score.
  final double? score;

  /// Converts a [RepositoryAdvisoryCvss] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'vector_string': vectorString, 'score': score};
  }

  @override
  int get hashCode => Object.hashAll([vectorString, score]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisoryCvss &&
        vectorString == other.vectorString &&
        score == other.score;
  }
}
