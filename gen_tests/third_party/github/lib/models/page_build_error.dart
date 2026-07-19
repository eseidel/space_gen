import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PageBuildError {
  const PageBuildError({required this.message});

  /// Converts a `Map<String, dynamic>` to a [PageBuildError].
  factory PageBuildError.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PageBuildError',
      json,
      () => PageBuildError(message: checkedKey(json, 'message') as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PageBuildError? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PageBuildError.fromJson(json);
  }

  final String? message;

  /// Converts a [PageBuildError] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PageBuildError && message == other.message;
  }
}
