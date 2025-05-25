import 'package:spacetraders/model/contract_terms.dart';
import 'package:spacetraders/model/contract_type.dart';

class Contract {
  Contract({
    required this.id,
    required this.factionSymbol,
    required this.type,
    required this.terms,
    required this.expiration,
    this.accepted = false,
    this.fulfilled = false,
    this.deadlineToAccept,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'] as String,
      factionSymbol: json['factionSymbol'] as String,
      type: ContractType.fromJson(json['type'] as String),
      terms: ContractTerms.fromJson(json['terms'] as Map<String, dynamic>),
      accepted: json['accepted'] as bool,
      fulfilled: json['fulfilled'] as bool,
      expiration: DateTime.parse(json['expiration'] as String),
      deadlineToAccept: DateTime.parse(json['deadlineToAccept'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Contract? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Contract.fromJson(json);
  }

  final String id;
  final String factionSymbol;
  final ContractType type;
  final ContractTerms terms;
  final bool accepted;
  final bool fulfilled;
  final DateTime expiration;
  final DateTime? deadlineToAccept;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'factionSymbol': factionSymbol,
      'type': type.toJson(),
      'terms': terms.toJson(),
      'accepted': accepted,
      'fulfilled': fulfilled,
      'expiration': expiration.toIso8601String(),
      'deadlineToAccept': deadlineToAccept?.toIso8601String(),
    };
  }
}
