// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/meta.dart';
import 'package:spacetraders/models/ship.dart';

/// {@template get_my_ships200_response}
/// Successfully listed ships.
/// {@endtemplate}
@immutable
class GetMyShips200Response {
  /// {@macro get_my_ships200_response}
  const GetMyShips200Response({required this.data, required this.meta});

  /// Converts a `Map<String, dynamic>` to a [GetMyShips200Response].
  factory GetMyShips200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetMyShips200Response',
      json,
      () => GetMyShips200Response(
        data: (json['data'] as List)
            .map<Ship>((e) => Ship.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyShips200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMyShips200Response.fromJson(json);
  }

  final List<Ship> data;

  /// Meta details for pagination.
  final Meta meta;

  /// Converts a [GetMyShips200Response] to a `Map<String, dynamic>`.
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
    return other is GetMyShips200Response &&
        listsEqual(data, other.data) &&
        meta == other.meta;
  }
}
