// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/contract.dart';

@immutable
class NegotiateContract201ResponseData {
  const NegotiateContract201ResponseData({required this.contract});

  /// Converts a `Map<String, dynamic>` to a [NegotiateContract201ResponseData].
  factory NegotiateContract201ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'NegotiateContract201ResponseData',
      json,
      () => NegotiateContract201ResponseData(
        contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      ),
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

  /// Contract details.
  final Contract contract;

  /// Converts a [NegotiateContract201ResponseData] to a `Map<String, dynamic>`.
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
