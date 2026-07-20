import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleMaxFileSizeParameters {
  RepositoryRuleMaxFileSizeParameters({required this.maxFileSize}) {
    maxFileSize.validate(min: 1, max: 100);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleMaxFileSizeParameters].
  factory RepositoryRuleMaxFileSizeParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleMaxFileSizeParameters',
      json,
      () => RepositoryRuleMaxFileSizeParameters(
        maxFileSize: json['max_file_size'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleMaxFileSizeParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleMaxFileSizeParameters.fromJson(json);
  }

  /// The maximum file size allowed in megabytes. This limit does not apply to
  /// Git Large File Storage (Git LFS).
  final int maxFileSize;

  /// Converts a [RepositoryRuleMaxFileSizeParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'max_file_size': maxFileSize};
  }

  @override
  int get hashCode => maxFileSize.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleMaxFileSizeParameters &&
        maxFileSize == other.maxFileSize;
  }
}
