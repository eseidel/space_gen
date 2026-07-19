import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template referrer_traffic}
/// Referrer Traffic
/// Referrer Traffic
/// {@endtemplate}
@immutable
class ReferrerTraffic {
  /// {@macro referrer_traffic}
  const ReferrerTraffic({
    required this.referrer,
    required this.count,
    required this.uniques,
  });

  /// Converts a `Map<String, dynamic>` to a [ReferrerTraffic].
  factory ReferrerTraffic.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReferrerTraffic',
      json,
      () => ReferrerTraffic(
        referrer: json['referrer'] as String,
        count: json['count'] as int,
        uniques: json['uniques'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReferrerTraffic? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReferrerTraffic.fromJson(json);
  }

  /// Example: `'Google'`
  final String referrer;

  /// Example: `4`
  final int count;

  /// Example: `3`
  final int uniques;

  /// Converts a [ReferrerTraffic] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'referrer': referrer, 'count': count, 'uniques': uniques};
  }

  @override
  int get hashCode => Object.hashAll([referrer, count, uniques]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReferrerTraffic &&
        referrer == other.referrer &&
        count == other.count &&
        uniques == other.uniques;
  }
}
