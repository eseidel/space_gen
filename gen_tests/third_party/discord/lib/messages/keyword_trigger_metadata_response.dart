import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class KeywordTriggerMetadataResponse {
  const KeywordTriggerMetadataResponse({
    required this.keywordFilter,
    required this.regexPatterns,
    required this.allowList,
  });

  /// Converts a `Map<String, dynamic>` to a [KeywordTriggerMetadataResponse].
  factory KeywordTriggerMetadataResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'KeywordTriggerMetadataResponse',
      json,
      () => KeywordTriggerMetadataResponse(
        keywordFilter: (json['keyword_filter'] as List).cast<String>(),
        regexPatterns: (json['regex_patterns'] as List).cast<String>(),
        allowList: (json['allow_list'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static KeywordTriggerMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return KeywordTriggerMetadataResponse.fromJson(json);
  }

  final List<String> keywordFilter;
  final List<String> regexPatterns;
  final List<String> allowList;

  /// Converts a [KeywordTriggerMetadataResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'keyword_filter': keywordFilter,
      'regex_patterns': regexPatterns,
      'allow_list': allowList,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(keywordFilter),
    listHash(regexPatterns),
    listHash(allowList),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KeywordTriggerMetadataResponse &&
        listsEqual(keywordFilter, other.keywordFilter) &&
        listsEqual(regexPatterns, other.regexPatterns) &&
        listsEqual(allowList, other.allowList);
  }
}
