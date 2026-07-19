import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/contract.dart';
import 'package:spacetraders/models/meta.dart';

/// {@template get_contracts200_response}
/// Successfully listed contracts.
/// {@endtemplate}
@immutable
class GetContracts200Response {
  /// {@macro get_contracts200_response}
  const GetContracts200Response({required this.data, required this.meta});

  /// Converts a `Map<String, dynamic>` to a [GetContracts200Response].
  factory GetContracts200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetContracts200Response',
      json,
      () => GetContracts200Response(
        data: (json['data'] as List)
            .map<Contract>((e) => Contract.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetContracts200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetContracts200Response.fromJson(json);
  }

  final List<Contract> data;

  /// Meta details for pagination.
  final Meta meta;

  /// Converts a [GetContracts200Response] to a `Map<String, dynamic>`.
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
    return other is GetContracts200Response &&
        listsEqual(data, other.data) &&
        meta == other.meta;
  }
}
