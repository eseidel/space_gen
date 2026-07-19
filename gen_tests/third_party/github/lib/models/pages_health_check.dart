import 'package:github/model_helpers.dart';
import 'package:github/models/pages_health_check_alt_domain.dart';
import 'package:github/models/pages_health_check_domain.dart';
import 'package:meta/meta.dart';

/// {@template pages_health_check}
/// Pages Health Check Status
/// Pages Health Check Status
/// {@endtemplate}
@immutable
class PagesHealthCheck {
  /// {@macro pages_health_check}
  const PagesHealthCheck({this.domain, this.altDomain});

  /// Converts a `Map<String, dynamic>` to a [PagesHealthCheck].
  factory PagesHealthCheck.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PagesHealthCheck',
      json,
      () => PagesHealthCheck(
        domain: PagesHealthCheckDomain.maybeFromJson(
          json['domain'] as Map<String, dynamic>?,
        ),
        altDomain: PagesHealthCheckAltDomain.maybeFromJson(
          json['alt_domain'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PagesHealthCheck? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PagesHealthCheck.fromJson(json);
  }

  final PagesHealthCheckDomain? domain;
  final PagesHealthCheckAltDomain? altDomain;

  /// Converts a [PagesHealthCheck] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'domain': domain?.toJson(), 'alt_domain': altDomain?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([domain, altDomain]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PagesHealthCheck &&
        domain == other.domain &&
        altDomain == other.altDomain;
  }
}
