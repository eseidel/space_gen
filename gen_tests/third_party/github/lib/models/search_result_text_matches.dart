// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/models/search_result_text_matches_inner.dart';

/// Search Result Text Matches
extension type const SearchResultTextMatches._(
  List<SearchResultTextMatchesInner> value
)
    implements List<SearchResultTextMatchesInner> {
  const SearchResultTextMatches(this.value);

  factory SearchResultTextMatches.fromJson(List<dynamic> json) =>
      SearchResultTextMatches(
        json
            .map<SearchResultTextMatchesInner>(
              (e) => SearchResultTextMatchesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      );

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchResultTextMatches? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SearchResultTextMatches.fromJson(json);
  }

  List<dynamic> toJson() => value.map((e) => e.toJson()).toList();
}
