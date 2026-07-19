import 'package:github/model_helpers.dart';
import 'package:github/models/search_result_text_matches_inner_matches_inner.dart';
import 'package:meta/meta.dart';

@immutable
class SearchResultTextMatchesInner {
  const SearchResultTextMatchesInner({
    this.objectUrl,
    this.objectType,
    this.property,
    this.fragment,
    this.matches,
  });

  /// Converts a `Map<String, dynamic>` to a [SearchResultTextMatchesInner].
  factory SearchResultTextMatchesInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SearchResultTextMatchesInner',
      json,
      () => SearchResultTextMatchesInner(
        objectUrl: json['object_url'] as String?,
        objectType: json['object_type'] as String?,
        property: json['property'] as String?,
        fragment: json['fragment'] as String?,
        matches: (json['matches'] as List?)
            ?.map<SearchResultTextMatchesInnerMatchesInner>(
              (e) => SearchResultTextMatchesInnerMatchesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchResultTextMatchesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SearchResultTextMatchesInner.fromJson(json);
  }

  final String? objectUrl;
  final String? objectType;
  final String? property;
  final String? fragment;
  final List<SearchResultTextMatchesInnerMatchesInner>? matches;

  /// Converts a [SearchResultTextMatchesInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (objectUrl != null) 'object_url': objectUrl,
      'object_type': objectType,
      if (property != null) 'property': property,
      if (fragment != null) 'fragment': fragment,
      if (matches != null) 'matches': matches?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    objectUrl,
    objectType,
    property,
    fragment,
    listHash(matches),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchResultTextMatchesInner &&
        objectUrl == other.objectUrl &&
        objectType == other.objectType &&
        property == other.property &&
        fragment == other.fragment &&
        listsEqual(matches, other.matches);
  }
}
