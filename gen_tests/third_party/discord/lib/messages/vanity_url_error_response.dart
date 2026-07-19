import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class VanityUrlErrorResponse {
  const VanityUrlErrorResponse({required this.message, required this.code});

  /// Converts a `Map<String, dynamic>` to a [VanityUrlErrorResponse].
  factory VanityUrlErrorResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'VanityUrlErrorResponse',
      json,
      () => VanityUrlErrorResponse(
        message: json['message'] as String,
        code: json['code'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static VanityUrlErrorResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return VanityUrlErrorResponse.fromJson(json);
  }

  final String message;
  final int code;

  /// Converts a [VanityUrlErrorResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': message, 'code': code};
  }

  @override
  int get hashCode => Object.hashAll([message, code]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VanityUrlErrorResponse &&
        message == other.message &&
        code == other.code;
  }
}
