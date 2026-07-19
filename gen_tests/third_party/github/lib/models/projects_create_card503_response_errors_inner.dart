import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsCreateCard503ResponseErrorsInner {
  const ProjectsCreateCard503ResponseErrorsInner({this.code, this.message});

  /// Converts a `Map<String, dynamic>` to a
  /// [ProjectsCreateCard503ResponseErrorsInner].
  factory ProjectsCreateCard503ResponseErrorsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ProjectsCreateCard503ResponseErrorsInner',
      json,
      () => ProjectsCreateCard503ResponseErrorsInner(
        code: json['code'] as String?,
        message: json['message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsCreateCard503ResponseErrorsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ProjectsCreateCard503ResponseErrorsInner.fromJson(json);
  }

  final String? code;
  final String? message;

  /// Converts a [ProjectsCreateCard503ResponseErrorsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message};
  }

  @override
  int get hashCode => Object.hashAll([code, message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsCreateCard503ResponseErrorsInner &&
        code == other.code &&
        message == other.message;
  }
}
