import 'package:meta/meta.dart';

@immutable
class ContractPayment {
  const ContractPayment({required this.onAccepted, required this.onFulfilled});

  factory ContractPayment.fromJson(Map<String, dynamic> json) {
    return ContractPayment(
      onAccepted: json['onAccepted'] as int,
      onFulfilled: json['onFulfilled'] as int,
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContractPayment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContractPayment.fromJson(json);
  }

  final int onAccepted;
  final int onFulfilled;

  Map<String, dynamic> toJson() {
    return {'onAccepted': onAccepted, 'onFulfilled': onFulfilled};
  }

  @override
  int get hashCode => Object.hash(onAccepted, onFulfilled);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContractPayment &&
        onAccepted == other.onAccepted &&
        onFulfilled == other.onFulfilled;
  }
}
