class ContractPayment {
  ContractPayment({required this.onAccepted, required this.onFulfilled});

  factory ContractPayment.fromJson(Map<String, dynamic> json) {
    return ContractPayment(
      onAccepted: json['onAccepted'] as int,
      onFulfilled: json['onFulfilled'] as int,
    );
  }

  final int onAccepted;
  final int onFulfilled;

  Map<String, dynamic> toJson() {
    return {'onAccepted': onAccepted, 'onFulfilled': onFulfilled};
  }
}
