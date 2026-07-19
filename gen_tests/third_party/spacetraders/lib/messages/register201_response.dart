import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/register201_response_data.dart';

/// {@template register201_response}
/// Successfully registered.
/// {@endtemplate}
@immutable
class Register201Response {
  /// {@macro register201_response}
  const Register201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [Register201Response].
  factory Register201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Register201Response',
      json,
      () => Register201Response(
        data: Register201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Register201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Register201Response.fromJson(json);
  }

  final Register201ResponseData data;

  /// Converts a [Register201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Register201Response && data == other.data;
  }
}
