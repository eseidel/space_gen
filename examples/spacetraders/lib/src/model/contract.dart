import 'package:spacetraders/src/model/contract_terms.dart';

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
      type: ContractTypeString.fromJson(json['type'] as String),
      terms: ContractTerms.fromJson(json['terms'] as Map<String, dynamic>),
      accepted: json['accepted'] as bool,
      fulfilled: json['fulfilled'] as bool,
      expiration: DateTime.parse(json['expiration'] as String),
      deadlineToAccept: DateTime.parse(json['deadlineToAccept'] as String),
    );
  }

  final String id;
  final String factionSymbol;
  final ContractTypeString type;
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

enum ContractTypeString {
  procurement('PROCUREMENT'),
  transport('TRANSPORT'),
  shuttle('SHUTTLE'),
  ;

  const ContractTypeString(this.value);

  factory ContractTypeString.fromJson(String json) {
    switch (json) {
      case 'PROCUREMENT':
        return ContractTypeString.procurement;
      case 'TRANSPORT':
        return ContractTypeString.transport;
      case 'SHUTTLE':
        return ContractTypeString.shuttle;
      default:
        throw Exception('Unknown ContractTypeString value: $json');
    }
  }

  final String value;

  String toJson() {
    switch (this) {
      case ContractTypeString.procurement:
        return 'PROCUREMENT';
      case ContractTypeString.transport:
        return 'TRANSPORT';
      case ContractTypeString.shuttle:
        return 'SHUTTLE';
    }
  }
}
