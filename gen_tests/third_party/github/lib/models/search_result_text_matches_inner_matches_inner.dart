import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class SearchResultTextMatchesInnerMatchesInner {
  const SearchResultTextMatchesInnerMatchesInner({this.text, this.indices});

  /// Converts a `Map<String, dynamic>` to a
  /// [SearchResultTextMatchesInnerMatchesInner].
  factory SearchResultTextMatchesInnerMatchesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SearchResultTextMatchesInnerMatchesInner',
      json,
      () => SearchResultTextMatchesInnerMatchesInner(
        text: json['text'] as String?,
        indices: (json['indices'] as List?)?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchResultTextMatchesInnerMatchesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SearchResultTextMatchesInnerMatchesInner.fromJson(json);
  }

  final String? text;
  final List<int>? indices;

  /// Converts a [SearchResultTextMatchesInnerMatchesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'text': text, 'indices': indices};
  }

  @override
  int get hashCode => Object.hashAll([text, listHash(indices)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchResultTextMatchesInnerMatchesInner &&
        text == other.text &&
        listsEqual(indices, other.indices);
  }
}
