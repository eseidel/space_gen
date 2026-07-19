import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ErrorResponse {
  const ErrorResponse({required this.statusCode});

  /// Converts a `Map<String, dynamic>` to an [ErrorResponse].
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ErrorResponse',
      json,
      () => ErrorResponse(statusCode: (json['statusCode'] as num).toDouble()),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ErrorResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ErrorResponse.fromJson(json);
  }

  final double statusCode;

  /// Converts an [ErrorResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'statusCode': statusCode};
  }

  @override
  int get hashCode => statusCode.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ErrorResponse && statusCode == other.statusCode;
  }
}
