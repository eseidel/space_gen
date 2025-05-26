import 'package:meta/meta.dart';
import 'package:spacetraders/model/get_my_factions200_response_data_inner.dart';
import 'package:spacetraders/model/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetMyFactions200Response {
  const GetMyFactions200Response({required this.meta, this.data = const []});

  factory GetMyFactions200Response.fromJson(Map<String, dynamic> json) {
    return GetMyFactions200Response(
      data:
          (json['data'] as List)
              .map<GetMyFactions200ResponseDataInner>(
                (e) => GetMyFactions200ResponseDataInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
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
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }

  @override
  int get hashCode => Object.hash(data, meta);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyFactions200Response &&
        listsEqual(data, other.data) &&
        meta == other.meta;
  }
}
