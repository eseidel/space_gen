import 'package:meta/meta.dart';
import 'package:spacetraders/model/contract.dart';

@immutable
class NegotiateContract201ResponseData {
  const NegotiateContract201ResponseData({required this.contract});

  factory NegotiateContract201ResponseData.fromJson(Map<String, dynamic> json) {
    return NegotiateContract201ResponseData(
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static NegotiateContract201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return NegotiateContract201ResponseData.fromJson(json);
  }

  final Contract contract;

  Map<String, dynamic> toJson() {
    return {'contract': contract.toJson()};
  }

  @override
  int get hashCode => contract.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NegotiateContract201ResponseData &&
        contract == other.contract;
  }
}
