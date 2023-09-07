import 'package:spacetraders/model/contract_terms.dart';

class Contract {
  Contract({
    required this.id,
    required this.factionSymbol,
    required this.type,
    required this.terms,
    required this.accepted,
    required this.fulfilled,
    required this.expiration,
    required this.deadlineToAccept,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'] as String,
      factionSymbol: json['factionSymbol'] as String,
      type: ContractTypeInner.fromJson(json['type'] as String),
      terms: ContractTerms.fromJson(json['terms'] as Map<String, dynamic>),
      accepted: json['accepted'] as bool,
      fulfilled: json['fulfilled'] as bool,
      expiration: DateTime.parse(json['expiration'] as String),
      deadlineToAccept: DateTime.parse(json['deadlineToAccept'] as String),
    );
  }

  final String id;
  final String factionSymbol;
  final ContractTypeInner type;
  final ContractTerms terms;
  final bool accepted;
  final bool fulfilled;
  final DateTime expiration;
  final DateTime deadlineToAccept;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'factionSymbol': factionSymbol,
      'type': type.toJson(),
      'terms': terms.toJson(),
      'accepted': accepted,
      'fulfilled': fulfilled,
      'expiration': expiration.toIso8601String(),
      'deadlineToAccept': deadlineToAccept.toIso8601String(),
    };
  }
}

enum ContractTypeInner {
  procurement('PROCUREMENT'),
  transport('TRANSPORT'),
  shuttle('SHUTTLE'),
  ;

  const ContractTypeInner(this.value);

  factory ContractTypeInner.fromJson(String json) {
    switch (json) {
      case 'PROCUREMENT':
        return ContractTypeInner.procurement;
      case 'TRANSPORT':
        return ContractTypeInner.transport;
      case 'SHUTTLE':
        return ContractTypeInner.shuttle;
      default:
        throw Exception('Unknown ContractTypeInner value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ContractTypeInner.procurement:
        return 'PROCUREMENT';
      case ContractTypeInner.transport:
        return 'TRANSPORT';
      case ContractTypeInner.shuttle:
        return 'SHUTTLE';
    }
  }
}
