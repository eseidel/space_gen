import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/faction.dart';

@immutable
class GetFaction200Response {
  const GetFaction200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetFaction200Response].
  factory GetFaction200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetFaction200Response',
      json,
      () => GetFaction200Response(
        data: Faction.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetFaction200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetFaction200Response.fromJson(json);
  }

  /// Faction details.
  final Faction data;

  /// Converts a [GetFaction200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetFaction200Response && data == other.data;
  }
}
