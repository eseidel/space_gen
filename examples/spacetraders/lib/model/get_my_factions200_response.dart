import 'package:spacetraders/model/get_my_factions200_response_data_item.dart';
import 'package:spacetraders/model/meta.dart';

class GetMyFactions200Response {
  GetMyFactions200Response({required this.data, required this.meta});

  factory GetMyFactions200Response.fromJson(Map<String, dynamic> json) {
    return GetMyFactions200Response(
      data:
          (json['data'] as List<dynamic>)
              .map<GetMyFactions200ResponseDataItem>(
                (e) => GetMyFactions200ResponseDataItem.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<GetMyFactions200ResponseDataItem> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}
