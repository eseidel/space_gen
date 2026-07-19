import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ErrorError {
  const ErrorError({
    required this.name,
    required this.message,
    this.stack,
    this.code,
  });

  /// Converts a `Map<String, dynamic>` to an [ErrorError].
  factory ErrorError.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ErrorError',
      json,
      () => ErrorError(
        name: json['name'] as String,
        message: json['message'] as String,
        stack: json['stack'] as String?,
        code: json['code'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ErrorError? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ErrorError.fromJson(json);
  }

  final String name;
  final String message;
  final String? stack;
  final String? code;

  /// Converts an [ErrorError] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'message': message, 'stack': stack, 'code': code};
  }

  @override
  int get hashCode => Object.hashAll([name, message, stack, code]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ErrorError &&
        name == other.name &&
        message == other.message &&
        stack == other.stack &&
        code == other.code;
  }
}
