import 'package:github/model_helpers.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/search_result_text_matches.dart';
import 'package:meta/meta.dart';

/// {@template code_search_result_item}
/// Code Search Result Item
/// Code Search Result Item
/// {@endtemplate}
@immutable
class CodeSearchResultItem {
  /// {@macro code_search_result_item}
  const CodeSearchResultItem({
    required this.name,
    required this.path,
    required this.sha,
    required this.url,
    required this.gitUrl,
    required this.htmlUrl,
    required this.repository,
    required this.score,
    this.fileSize,
    this.language,
    this.lastModifiedAt,
    this.lineNumbers,
    this.textMatches,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeSearchResultItem].
  factory CodeSearchResultItem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeSearchResultItem',
      json,
      () => CodeSearchResultItem(
        name: json['name'] as String,
        path: json['path'] as String,
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
        gitUrl: Uri.parse(json['git_url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        repository: MinimalRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
        score: (json['score'] as num).toDouble(),
        fileSize: json['file_size'] as int?,
        language: json['language'] as String?,
        lastModifiedAt: maybeParseDateTime(json['last_modified_at'] as String?),
        lineNumbers: (json['line_numbers'] as List?)?.cast<String>(),
        textMatches: SearchResultTextMatches.maybeFromJson(
          json['text_matches'] as List?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeSearchResultItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeSearchResultItem.fromJson(json);
  }

  final String name;
  final String path;
  final String sha;
  final Uri url;
  final Uri gitUrl;
  final Uri htmlUrl;

  /// Minimal Repository
  /// Minimal Repository
  final MinimalRepository repository;
  final double score;
  final int? fileSize;
  final String? language;
  final DateTime? lastModifiedAt;

  /// Example: `'73..77'`
  /// Example: `'77..78'`
  final List<String>? lineNumbers;

  /// Search Result Text Matches
  final SearchResultTextMatches? textMatches;

  /// Converts a [CodeSearchResultItem] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'path': path,
      'sha': sha,
      'url': url.toString(),
      'git_url': gitUrl.toString(),
      'html_url': htmlUrl.toString(),
      'repository': repository.toJson(),
      'score': score,
      'file_size': ?fileSize,
      'language': language,
      'last_modified_at': ?lastModifiedAt?.toIso8601String(),
      'line_numbers': ?lineNumbers,
      'text_matches': ?textMatches?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    path,
    sha,
    url,
    gitUrl,
    htmlUrl,
    repository,
    score,
    fileSize,
    language,
    lastModifiedAt,
    listHash(lineNumbers),
    listHash(textMatches),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSearchResultItem &&
        name == other.name &&
        path == other.path &&
        sha == other.sha &&
        url == other.url &&
        gitUrl == other.gitUrl &&
        htmlUrl == other.htmlUrl &&
        repository == other.repository &&
        score == other.score &&
        fileSize == other.fileSize &&
        language == other.language &&
        lastModifiedAt == other.lastModifiedAt &&
        listsEqual(lineNumbers, other.lineNumbers) &&
        listsEqual(textMatches, other.textMatches);
  }
}
