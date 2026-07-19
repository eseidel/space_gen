import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/negotiate_contract201_response_data.dart';

/// {@template negotiate_contract201_response}
/// Negotiate Contract 201 Response
/// Successfully negotiated a new contract.
/// {@endtemplate}
@immutable
class NegotiateContract201Response {
  /// {@macro negotiate_contract201_response}
  const NegotiateContract201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [NegotiateContract201Response].
  factory NegotiateContract201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'NegotiateContract201Response',
      json,
      () => NegotiateContract201Response(
        data: NegotiateContract201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NegotiateContract201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return NegotiateContract201Response.fromJson(json);
  }

  final NegotiateContract201ResponseData data;

  /// Converts a [NegotiateContract201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NegotiateContract201Response && data == other.data;
  }
}
