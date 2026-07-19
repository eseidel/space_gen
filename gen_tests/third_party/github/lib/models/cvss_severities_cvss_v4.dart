import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CvssSeveritiesCvssV4 {
  const CvssSeveritiesCvssV4({required this.vectorString, required this.score});

  /// Converts a `Map<String, dynamic>` to a [CvssSeveritiesCvssV4].
  factory CvssSeveritiesCvssV4.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CvssSeveritiesCvssV4',
      json,
      () => CvssSeveritiesCvssV4(
        vectorString: checkedKey(json, 'vector_string') as String?,
        score: (checkedKey(json, 'score') as num?)?.toDouble(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CvssSeveritiesCvssV4? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CvssSeveritiesCvssV4.fromJson(json);
  }

  /// The CVSS 4 vector string.
  final String? vectorString;

  /// The CVSS 4 score.
  final double? score;

  /// Converts a [CvssSeveritiesCvssV4] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'vector_string': vectorString, 'score': score};
  }

  @override
  int get hashCode => Object.hashAll([vectorString, score]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CvssSeveritiesCvssV4 &&
        vectorString == other.vectorString &&
        score == other.score;
  }
}
