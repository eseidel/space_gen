import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ApiOverviewDomainsActionsInbound {
  const ApiOverviewDomainsActionsInbound({
    this.fullDomains,
    this.wildcardDomains,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApiOverviewDomainsActionsInbound].
  factory ApiOverviewDomainsActionsInbound.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiOverviewDomainsActionsInbound',
      json,
      () => ApiOverviewDomainsActionsInbound(
        fullDomains: (json['full_domains'] as List?)?.cast<String>(),
        wildcardDomains: (json['wildcard_domains'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiOverviewDomainsActionsInbound? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApiOverviewDomainsActionsInbound.fromJson(json);
  }

  final List<String>? fullDomains;
  final List<String>? wildcardDomains;

  /// Converts an [ApiOverviewDomainsActionsInbound]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'full_domains': fullDomains, 'wildcard_domains': wildcardDomains};
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(fullDomains), listHash(wildcardDomains)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiOverviewDomainsActionsInbound &&
        listsEqual(fullDomains, other.fullDomains) &&
        listsEqual(wildcardDomains, other.wildcardDomains);
  }
}
