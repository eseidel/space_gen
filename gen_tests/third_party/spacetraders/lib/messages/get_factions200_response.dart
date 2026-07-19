import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/faction.dart';
import 'package:spacetraders/models/meta.dart';

/// {@template get_factions200_response}
/// Successfully fetched factions.
/// {@endtemplate}
@immutable
class GetFactions200Response {
  /// {@macro get_factions200_response}
  const GetFactions200Response({required this.data, required this.meta});

  /// Converts a `Map<String, dynamic>` to a [GetFactions200Response].
  factory GetFactions200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetFactions200Response',
      json,
      () => GetFactions200Response(
        data: (json['data'] as List)
            .map<Faction>((e) => Faction.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetFactions200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetFactions200Response.fromJson(json);
  }

  final List<Faction> data;

  /// Meta details for pagination.
  final Meta meta;

  /// Converts a [GetFactions200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(data), meta]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetFactions200Response &&
        listsEqual(data, other.data) &&
        meta == other.meta;
  }
}
