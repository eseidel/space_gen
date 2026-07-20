import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GlobalAdvisoryCvss {
  GlobalAdvisoryCvss({required this.vectorString, required this.score}) {
    score?.validate(min: 0.0, max: 10.0);
  }

  /// Converts a `Map<String, dynamic>` to a [GlobalAdvisoryCvss].
  factory GlobalAdvisoryCvss.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GlobalAdvisoryCvss',
      json,
      () => GlobalAdvisoryCvss(
        vectorString: checkedKey(json, 'vector_string') as String?,
        score: (checkedKey(json, 'score') as num?)?.toDouble(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GlobalAdvisoryCvss? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GlobalAdvisoryCvss.fromJson(json);
  }

  /// The CVSS vector.
  final String? vectorString;

  /// The CVSS score.
  final double? score;

  /// Converts a [GlobalAdvisoryCvss] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'vector_string': vectorString, 'score': score};
  }

  @override
  int get hashCode => Object.hashAll([vectorString, score]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GlobalAdvisoryCvss &&
        vectorString == other.vectorString &&
        score == other.score;
  }
}
