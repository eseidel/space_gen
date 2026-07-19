import 'package:meta/meta.dart';
import 'package:petstore/model_helpers.dart';

@immutable
class ApiResponse {
  const ApiResponse({this.code, this.type, this.message});

  /// Converts a `Map<String, dynamic>` to an [ApiResponse].
  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiResponse',
      json,
      () => ApiResponse(
        code: json['code'] as int?,
        type: json['type'] as String?,
        message: json['message'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiResponse.fromJson(json);
  }

  final int? code;
  final String? type;
  final String? message;

  /// Converts an [ApiResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'code': ?code, 'type': ?type, 'message': ?message};
  }

  @override
  int get hashCode => Object.hashAll([code, type, message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiResponse &&
        code == other.code &&
        type == other.type &&
        message == other.message;
  }
}
