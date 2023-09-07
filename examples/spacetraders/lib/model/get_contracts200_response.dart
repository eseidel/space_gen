import 'package:spacetraders/model/contract.dart';
import 'package:spacetraders/model/meta.dart';

class GetContracts200Response {
  GetContracts200Response({
    required this.data,
    required this.meta,
  });

  factory GetContracts200Response.fromJson(Map<String, dynamic> json) {
    return GetContracts200Response(
      data: (json['data'] as List<dynamic>)
          .map<Contract>((e) => Contract.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<Contract> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}
