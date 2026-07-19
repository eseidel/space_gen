import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';
import 'package:spacetraders/models/contract.dart';

@immutable
class AcceptContract200ResponseData {
  const AcceptContract200ResponseData({
    required this.contract,
    required this.agent,
  });

  /// Converts a `Map<String, dynamic>` to an [AcceptContract200ResponseData].
  factory AcceptContract200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AcceptContract200ResponseData',
      json,
      () => AcceptContract200ResponseData(
        contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
        agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AcceptContract200ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AcceptContract200ResponseData.fromJson(json);
  }

  /// Contract details.
  final Contract contract;

  /// Agent details.
  final Agent agent;

  /// Converts an [AcceptContract200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'contract': contract.toJson(), 'agent': agent.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([contract, agent]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AcceptContract200ResponseData &&
        contract == other.contract &&
        agent == other.agent;
  }
}
