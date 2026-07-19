import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/ship_refine_request_produce.dart';

@immutable
class ShipRefineRequest {
  const ShipRefineRequest({required this.produce});

  /// Converts a `Map<String, dynamic>` to a [ShipRefineRequest].
  factory ShipRefineRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShipRefineRequest',
      json,
      () => ShipRefineRequest(
        produce: ShipRefineRequestProduce.fromJson(json['produce'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShipRefineRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShipRefineRequest.fromJson(json);
  }

  /// The type of good to produce out of the refining process.
  final ShipRefineRequestProduce produce;

  /// Converts a [ShipRefineRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'produce': produce.toJson()};
  }

  @override
  int get hashCode => produce.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShipRefineRequest && produce == other.produce;
  }
}
