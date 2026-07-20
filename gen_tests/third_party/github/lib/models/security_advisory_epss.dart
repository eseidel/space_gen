import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template security_advisory_epss}
/// The EPSS scores as calculated by the [Exploit Prediction Scoring
/// System](https://www.first.org/epss).
/// {@endtemplate}
@immutable
class SecurityAdvisoryEpss {
  /// {@macro security_advisory_epss}
  SecurityAdvisoryEpss({this.percentage, this.percentile}) {
    percentage?.validate(min: 0.0, max: 100.0);
    percentile?.validate(min: 0.0, max: 100.0);
  }

  /// Converts a `Map<String, dynamic>` to a [SecurityAdvisoryEpss].
  factory SecurityAdvisoryEpss.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecurityAdvisoryEpss',
      json,
      () => SecurityAdvisoryEpss(
        percentage: (json['percentage'] as num?)?.toDouble(),
        percentile: (json['percentile'] as num?)?.toDouble(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAdvisoryEpss? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoryEpss.fromJson(json);
  }

  final double? percentage;
  final double? percentile;

  /// Converts a [SecurityAdvisoryEpss] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'percentage': ?percentage, 'percentile': ?percentile};
  }

  @override
  int get hashCode => Object.hashAll([percentage, percentile]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAdvisoryEpss &&
        percentage == other.percentage &&
        percentile == other.percentile;
  }
}
