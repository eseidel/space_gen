import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/survey_deposit.dart';
import 'package:spacetraders/models/survey_size.dart';

/// {@template survey}
/// A resource survey of a waypoint, detailing a specific extraction location
/// and the types of resources that can be found there.
/// {@endtemplate}
@immutable
class Survey {
  /// {@macro survey}
  Survey({
    required this.signature,
    required this.symbol,
    required this.deposits,
    required this.expiration,
    required this.size,
  }) {
    signature.validate(minLength: 1);
    symbol.validate(minLength: 1);
  }

  /// Converts a `Map<String, dynamic>` to a [Survey].
  factory Survey.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Survey',
      json,
      () => Survey(
        signature: json['signature'] as String,
        symbol: json['symbol'] as String,
        deposits: (json['deposits'] as List)
            .map<SurveyDeposit>(
              (e) => SurveyDeposit.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        expiration: DateTime.parse(json['expiration'] as String),
        size: SurveySize.fromJson(json['size'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Survey? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Survey.fromJson(json);
  }

  /// A unique signature for the location of this survey. This signature is
  /// verified when attempting an extraction using this survey.
  final String signature;

  /// The symbol of the waypoint that this survey is for.
  final String symbol;

  /// A list of deposits that can be found at this location. A ship will
  /// extract one of these deposits when using this survey in an extraction
  /// request. If multiple deposits of the same type are present, the chance
  /// of extracting that deposit is increased.
  final List<SurveyDeposit> deposits;

  /// The date and time when the survey expires. After this date and time, the
  /// survey will no longer be available for extraction.
  final DateTime expiration;

  /// The size of the deposit. This value indicates how much can be extracted
  /// from the survey before it is exhausted.
  final SurveySize size;

  /// Converts a [Survey] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'signature': signature,
      'symbol': symbol,
      'deposits': deposits.map((e) => e.toJson()).toList(),
      'expiration': expiration.toIso8601String(),
      'size': size.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([signature, symbol, listHash(deposits), expiration, size]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Survey &&
        signature == other.signature &&
        symbol == other.symbol &&
        listsEqual(deposits, other.deposits) &&
        expiration == other.expiration &&
        size == other.size;
  }
}
