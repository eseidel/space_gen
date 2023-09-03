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
      type: json['type'] as String,
      terms: ContractTerms.fromJson(json['terms'] as Map<String, dynamic>),
      accepted: json['accepted'] as bool,
      fulfilled: json['fulfilled'] as bool,
      expiration: json['expiration'] as String,
      deadlineToAccept: json['deadlineToAccept'] as String,
    );
  }

  final String id;
  final String factionSymbol;
  final String type;
  final ContractTerms terms;
  final bool accepted;
  final bool fulfilled;
  final String expiration;
  final String deadlineToAccept;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'factionSymbol': factionSymbol,
      'type': type,
      'terms': terms.toJson(),
      'accepted': accepted,
      'fulfilled': fulfilled,
      'expiration': expiration,
      'deadlineToAccept': deadlineToAccept,
    };
  }
}
