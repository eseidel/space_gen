import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleMaxFilePathLengthParameters {
  const RepositoryRuleMaxFilePathLengthParameters({
    required this.maxFilePathLength,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleMaxFilePathLengthParameters].
  factory RepositoryRuleMaxFilePathLengthParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleMaxFilePathLengthParameters',
      json,
      () => RepositoryRuleMaxFilePathLengthParameters(
        maxFilePathLength: json['max_file_path_length'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleMaxFilePathLengthParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleMaxFilePathLengthParameters.fromJson(json);
  }

  /// The maximum amount of characters allowed in file paths.
  final int maxFilePathLength;

  /// Converts a [RepositoryRuleMaxFilePathLengthParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'max_file_path_length': maxFilePathLength};
  }

  @override
  int get hashCode => maxFilePathLength.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleMaxFilePathLengthParameters &&
        maxFilePathLength == other.maxFilePathLength;
  }
}
