import 'package:meta/meta.dart';
import 'package:spacetraders/model/negotiate_contract201_response_data.dart';

@immutable
class NegotiateContract201Response {
  const NegotiateContract201Response({required this.data});

  factory NegotiateContract201Response.fromJson(Map<String, dynamic> json) {
    return NegotiateContract201Response(
      data: NegotiateContract201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
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
