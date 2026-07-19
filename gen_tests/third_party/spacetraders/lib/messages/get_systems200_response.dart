import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/meta.dart';
import 'package:spacetraders/models/system.dart';

/// {@template get_systems200_response}
/// Successfully listed systems.
/// {@endtemplate}
@immutable
class GetSystems200Response {
  /// {@macro get_systems200_response}
  const GetSystems200Response({required this.data, required this.meta});

  /// Converts a `Map<String, dynamic>` to a [GetSystems200Response].
  factory GetSystems200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetSystems200Response',
      json,
      () => GetSystems200Response(
        data: (json['data'] as List)
            .map<System>((e) => System.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSystems200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetSystems200Response.fromJson(json);
  }

  final List<System> data;

  /// Meta details for pagination.
  final Meta meta;

  /// Converts a [GetSystems200Response] to a `Map<String, dynamic>`.
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
    return other is GetSystems200Response &&
        listsEqual(data, other.data) &&
        meta == other.meta;
  }
}
