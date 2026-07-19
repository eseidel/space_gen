import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/transfer_cargo200_response_data.dart';

/// {@template transfer_cargo200_response}
/// Transfer Cargo 200 Response
/// Cargo transferred successfully.
/// {@endtemplate}
@immutable
class TransferCargo200Response {
  /// {@macro transfer_cargo200_response}
  const TransferCargo200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [TransferCargo200Response].
  factory TransferCargo200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TransferCargo200Response',
      json,
      () => TransferCargo200Response(
        data: TransferCargo200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
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

  /// Converts a [TransferCargo200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransferCargo200Response && data == other.data;
  }
}
