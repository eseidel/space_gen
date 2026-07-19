import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/scrap_transaction.dart';

@immutable
class ScrapShip200ResponseData {
  const ScrapShip200ResponseData({
    required this.agent,
    required this.transaction,
  });

  /// Converts a `Map<String, dynamic>` to a [ScrapShip200ResponseData].
  factory ScrapShip200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScrapShip200ResponseData',
      json,
      () => ScrapShip200ResponseData(
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
        transaction: ScrapTransaction.fromJson(
          json['transaction'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScrapShip200ResponseData? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScrapShip200ResponseData.fromJson(json);
  }

  /// Agent details.
  final Agent agent;

  /// Result of a scrap transaction.
  final ScrapTransaction transaction;

  /// Converts a [ScrapShip200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'agent': agent.toJson(), 'transaction': transaction.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([agent, transaction]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScrapShip200ResponseData &&
        agent == other.agent &&
        transaction == other.transaction;
  }
}
