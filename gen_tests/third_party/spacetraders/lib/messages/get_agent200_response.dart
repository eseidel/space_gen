import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/public_agent.dart';

@immutable
class GetAgent200Response {
  const GetAgent200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetAgent200Response].
  factory GetAgent200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetAgent200Response',
      json,
      () => GetAgent200Response(
        data: PublicAgent.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetAgent200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetAgent200Response.fromJson(json);
  }

  /// Public agent details.
  final PublicAgent data;

  /// Converts a [GetAgent200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetAgent200Response && data == other.data;
  }
}
