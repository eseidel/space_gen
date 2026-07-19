import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetMyFactions200ResponseDataInner {
  const GetMyFactions200ResponseDataInner({
    required this.symbol,
    required this.reputation,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [GetMyFactions200ResponseDataInner].
  factory GetMyFactions200ResponseDataInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'GetMyFactions200ResponseDataInner',
      json,
      () => GetMyFactions200ResponseDataInner(
        symbol: json['symbol'] as String,
        reputation: json['reputation'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyFactions200ResponseDataInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetMyFactions200ResponseDataInner.fromJson(json);
  }

  final String symbol;
  final int reputation;

  /// Converts a [GetMyFactions200ResponseDataInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'reputation': reputation};
  }

  @override
  int get hashCode => Object.hashAll([symbol, reputation]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyFactions200ResponseDataInner &&
        symbol == other.symbol &&
        reputation == other.reputation;
  }
}
