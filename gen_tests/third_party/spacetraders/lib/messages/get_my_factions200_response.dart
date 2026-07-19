import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/get_my_factions200_response_data_inner.dart';
import 'package:spacetraders/models/meta.dart';

@immutable
class GetMyFactions200Response {
  const GetMyFactions200Response({required this.data, required this.meta});

  /// Converts a `Map<String, dynamic>` to a [GetMyFactions200Response].
  factory GetMyFactions200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetMyFactions200Response',
      json,
      () => GetMyFactions200Response(
        data: (json['data'] as List)
            .map<GetMyFactions200ResponseDataInner>(
              (e) => GetMyFactions200ResponseDataInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyFactions200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMyFactions200Response.fromJson(json);
  }

  final List<GetMyFactions200ResponseDataInner> data;

  /// Meta details for pagination.
  final Meta meta;

  /// Converts a [GetMyFactions200Response] to a `Map<String, dynamic>`.
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
    return other is GetMyFactions200Response &&
        listsEqual(data, other.data) &&
        meta == other.meta;
  }
}
