import 'package:github/date.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/pages_https_certificate_state.dart';
import 'package:meta/meta.dart';

/// {@template pages_https_certificate}
/// Pages Https Certificate
/// {@endtemplate}
@immutable
class PagesHttpsCertificate {
  /// {@macro pages_https_certificate}
  const PagesHttpsCertificate({
    required this.state,
    required this.description,
    required this.domains,
    this.expiresAt,
  });

  /// Converts a `Map<String, dynamic>` to a [PagesHttpsCertificate].
  factory PagesHttpsCertificate.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PagesHttpsCertificate',
      json,
      () => PagesHttpsCertificate(
        state: PagesHttpsCertificateState.fromJson(json['state'] as String),
        description: json['description'] as String,
        domains: (json['domains'] as List).cast<String>(),
        expiresAt: Date.maybeFromJson(json['expires_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PagesHttpsCertificate? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PagesHttpsCertificate.fromJson(json);
  }

  /// Example: `'approved'`
  final PagesHttpsCertificateState state;

  /// Example: `'Certificate is approved'`
  final String description;

  /// Array of the domain set and its alternate name (if it is configured)
  /// Example: `'example.com'`
  /// Example: `'www.example.com'`
  final List<String> domains;
  final Date? expiresAt;

  /// Converts a [PagesHttpsCertificate] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'state': state.toJson(),
      'description': description,
      'domains': domains,
      'expires_at': expiresAt?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([state, description, listHash(domains), expiresAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PagesHttpsCertificate &&
        state == other.state &&
        description == other.description &&
        listsEqual(domains, other.domains) &&
        expiresAt == other.expiresAt;
  }
}
