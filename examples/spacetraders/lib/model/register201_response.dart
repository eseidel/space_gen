import 'package:meta/meta.dart';
import 'package:spacetraders/model/register201_response_data.dart';

@immutable
class Register201Response {
  const Register201Response({required this.data});

  factory Register201Response.fromJson(Map<String, dynamic> json) {
    return Register201Response(
      data: Register201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
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
