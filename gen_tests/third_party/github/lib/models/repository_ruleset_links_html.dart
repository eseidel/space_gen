import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRulesetLinksHtml {
  const RepositoryRulesetLinksHtml({this.href});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRulesetLinksHtml].
  factory RepositoryRulesetLinksHtml.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRulesetLinksHtml',
      json,
      () => RepositoryRulesetLinksHtml(href: json['href'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulesetLinksHtml? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetLinksHtml.fromJson(json);
  }

  /// The html URL of the ruleset
  final String? href;

  /// Converts a [RepositoryRulesetLinksHtml] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': ?href};
  }

  @override
  int get hashCode => href.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRulesetLinksHtml && href == other.href;
  }
}
