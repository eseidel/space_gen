import 'package:spacetraders/model/contract.dart';

class NegotiateContract201Response {
  NegotiateContract201Response({required this.data});

  factory NegotiateContract201Response.fromJson(Map<String, dynamic> json) {
    return NegotiateContract201Response(
      data: NegotiateContract201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final NegotiateContract201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class NegotiateContract201ResponseData {
  NegotiateContract201ResponseData({required this.contract});

  factory NegotiateContract201ResponseData.fromJson(Map<String, dynamic> json) {
    return NegotiateContract201ResponseData(
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }

  final Contract contract;

  Map<String, dynamic> toJson() {
    return {'contract': contract.toJson()};
  }
}
