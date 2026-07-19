import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsMoveCard503ResponseErrorsInner {
  const ProjectsMoveCard503ResponseErrorsInner({this.code, this.message});

  /// Converts a `Map<String, dynamic>` to a
  /// [ProjectsMoveCard503ResponseErrorsInner].
  factory ProjectsMoveCard503ResponseErrorsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProjectsMoveCard503ResponseErrorsInner',
      json,
      () => ProjectsMoveCard503ResponseErrorsInner(
        code: json['code'] as String?,
        message: json['message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsMoveCard503ResponseErrorsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsMoveCard503ResponseErrorsInner.fromJson(json);
  }

  final String? code;
  final String? message;

  /// Converts a [ProjectsMoveCard503ResponseErrorsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message};
  }

  @override
  int get hashCode => Object.hashAll([code, message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsMoveCard503ResponseErrorsInner &&
        code == other.code &&
        message == other.message;
  }
}
