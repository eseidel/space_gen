import 'package:spacetraders/model/transfer_cargo200_response_data.dart';

class TransferCargo200Response {
  TransferCargo200Response({required this.data});

  factory TransferCargo200Response.fromJson(Map<String, dynamic> json) {
    return TransferCargo200Response(
      data: TransferCargo200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TransferCargo200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TransferCargo200Response.fromJson(json);
  }

  final TransferCargo200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
