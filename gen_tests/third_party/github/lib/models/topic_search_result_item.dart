import 'package:github/model_helpers.dart';
import 'package:github/models/search_result_text_matches.dart';
import 'package:github/models/topic_search_result_item_aliases_inner.dart';
import 'package:github/models/topic_search_result_item_related_inner.dart';
import 'package:meta/meta.dart';

/// {@template topic_search_result_item}
/// Topic Search Result Item
/// Topic Search Result Item
/// {@endtemplate}
@immutable
class TopicSearchResultItem {
  /// {@macro topic_search_result_item}
  const TopicSearchResultItem({
    required this.name,
    required this.displayName,
    required this.shortDescription,
    required this.description,
    required this.createdBy,
    required this.released,
    required this.createdAt,
    required this.updatedAt,
    required this.featured,
    required this.curated,
    required this.score,
    this.repositoryCount,
    this.logoUrl,
    this.textMatches,
    this.related,
    this.aliases,
  });

  /// Converts a `Map<String, dynamic>` to a [TopicSearchResultItem].
  factory TopicSearchResultItem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TopicSearchResultItem',
      json,
      () => TopicSearchResultItem(
        name: json['name'] as String,
        displayName: checkedKey(json, 'display_name') as String?,
        shortDescription: checkedKey(json, 'short_description') as String?,
        description: checkedKey(json, 'description') as String?,
        createdBy: checkedKey(json, 'created_by') as String?,
        released: checkedKey(json, 'released') as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        featured: json['featured'] as bool,
        curated: json['curated'] as bool,
        score: (json['score'] as num).toDouble(),
        repositoryCount: json['repository_count'] as int?,
        logoUrl: maybeParseUri(json['logo_url'] as String?),
        textMatches: SearchResultTextMatches.maybeFromJson(
          json['text_matches'] as List?,
        ),
        related: (json['related'] as List?)
            ?.map<TopicSearchResultItemRelatedInner>(
              (e) => TopicSearchResultItemRelatedInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        aliases: (json['aliases'] as List?)
            ?.map<TopicSearchResultItemAliasesInner>(
              (e) => TopicSearchResultItemAliasesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TopicSearchResultItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TopicSearchResultItem.fromJson(json);
  }

  final String name;
  final String? displayName;
  final String? shortDescription;
  final String? description;
  final String? createdBy;
  final String? released;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool featured;
  final bool curated;
  final double score;
  final int? repositoryCount;
  final Uri? logoUrl;

  /// Search Result Text Matches
  final SearchResultTextMatches? textMatches;
  final List<TopicSearchResultItemRelatedInner>? related;
  final List<TopicSearchResultItemAliasesInner>? aliases;

  /// Converts a [TopicSearchResultItem] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'display_name': displayName,
      'short_description': shortDescription,
      'description': description,
      'created_by': createdBy,
      'released': released,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'featured': featured,
      'curated': curated,
      'score': score,
      'repository_count': repositoryCount,
      'logo_url': logoUrl?.toString(),
      'text_matches': ?textMatches?.toJson(),
      'related': related?.map((e) => e.toJson()).toList(),
      'aliases': aliases?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    displayName,
    shortDescription,
    description,
    createdBy,
    released,
    createdAt,
    updatedAt,
    featured,
    curated,
    score,
    repositoryCount,
    logoUrl,
    listHash(textMatches),
    listHash(related),
    listHash(aliases),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TopicSearchResultItem &&
        name == other.name &&
        displayName == other.displayName &&
        shortDescription == other.shortDescription &&
        description == other.description &&
        createdBy == other.createdBy &&
        released == other.released &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        featured == other.featured &&
        curated == other.curated &&
        score == other.score &&
        repositoryCount == other.repositoryCount &&
        logoUrl == other.logoUrl &&
        listsEqual(textMatches, other.textMatches) &&
        listsEqual(related, other.related) &&
        listsEqual(aliases, other.aliases);
  }
}
