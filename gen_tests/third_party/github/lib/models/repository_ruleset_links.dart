import 'package:github/model_helpers.dart';
import 'package:github/models/repository_ruleset_links_html.dart';
import 'package:github/models/repository_ruleset_links_self.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRulesetLinks {
  const RepositoryRulesetLinks({this.self, this.html});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRulesetLinks].
  factory RepositoryRulesetLinks.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRulesetLinks',
      json,
      () => RepositoryRulesetLinks(
        self: RepositoryRulesetLinksSelf.maybeFromJson(
          json['self'] as Map<String, dynamic>?,
        ),
        html: RepositoryRulesetLinksHtml.maybeFromJson(
          json['html'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulesetLinks? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetLinks.fromJson(json);
  }

  final RepositoryRulesetLinksSelf? self;
  final RepositoryRulesetLinksHtml? html;

  /// Converts a [RepositoryRulesetLinks] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'self': ?self?.toJson(), 'html': html?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([self, html]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRulesetLinks &&
        self == other.self &&
        html == other.html;
  }
}
