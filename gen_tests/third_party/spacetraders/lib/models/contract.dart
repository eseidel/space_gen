import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/contract_terms.dart';
import 'package:spacetraders/models/contract_type.dart';

/// {@template contract}
/// Contract details.
/// {@endtemplate}
@immutable
class Contract {
  /// {@macro contract}
  const Contract({
    required this.id,
    required this.factionSymbol,
    required this.type,
    required this.terms,
    @deprecated required this.expiration,
    this.accepted = false,
    this.fulfilled = false,
    this.deadlineToAccept,
  });

  /// Converts a `Map<String, dynamic>` to a [Contract].
  factory Contract.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Contract',
      json,
      () => Contract(
        id: json['id'] as String,
        factionSymbol: json['factionSymbol'] as String,
        type: ContractType.fromJson(json['type'] as String),
        terms: ContractTerms.fromJson(json['terms'] as Map<String, dynamic>),
        accepted: json['accepted'] as bool,
        fulfilled: json['fulfilled'] as bool,
        expiration: DateTime.parse(json['expiration'] as String),
        deadlineToAccept: maybeParseDateTime(
          json['deadlineToAccept'] as String?,
        ),
      ),
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

  /// ID of the contract.
  final String id;

  /// The symbol of the faction that this contract is for.
  final String factionSymbol;

  /// Type of contract.
  final ContractType type;

  /// The terms to fulfill the contract.
  final ContractTerms terms;

  /// Whether the contract has been accepted by the agent
  final bool accepted;

  /// Whether the contract has been fulfilled
  final bool fulfilled;

  /// Deprecated in favor of deadlineToAccept
  @deprecated
  final DateTime expiration;

  /// The time at which the contract is no longer available to be accepted
  final DateTime? deadlineToAccept;

  /// Converts a [Contract] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'factionSymbol': factionSymbol,
      'type': type.toJson(),
      'terms': terms.toJson(),
      'accepted': accepted,
      'fulfilled': fulfilled,
      'expiration': expiration.toIso8601String(),
      if (deadlineToAccept != null)
        'deadlineToAccept': deadlineToAccept?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    factionSymbol,
    type,
    terms,
    accepted,
    fulfilled,
    expiration,
    deadlineToAccept,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Contract &&
        id == other.id &&
        factionSymbol == other.factionSymbol &&
        type == other.type &&
        terms == other.terms &&
        accepted == other.accepted &&
        fulfilled == other.fulfilled &&
        expiration == other.expiration &&
        deadlineToAccept == other.deadlineToAccept;
  }
}
