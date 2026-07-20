import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class KeywordTriggerMetadata {
  KeywordTriggerMetadata({
    this.keywordFilter,
    this.regexPatterns,
    this.allowList,
  }) {
    keywordFilter?.validate(maxItems: 1000);
    regexPatterns?.validate(maxItems: 10);
    allowList?.validate(maxItems: 100);
  }

  /// Converts a `Map<String, dynamic>` to a [KeywordTriggerMetadata].
  factory KeywordTriggerMetadata.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'KeywordTriggerMetadata',
      json,
      () => KeywordTriggerMetadata(
        keywordFilter: (json['keyword_filter'] as List?)?.cast<String>(),
        regexPatterns: (json['regex_patterns'] as List?)?.cast<String>(),
        allowList: (json['allow_list'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static KeywordTriggerMetadata? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return KeywordTriggerMetadata.fromJson(json);
  }

  final List<String>? keywordFilter;
  final List<String>? regexPatterns;
  final List<String>? allowList;

  /// Converts a [KeywordTriggerMetadata] to a `Map<String, dynamic>`.
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
    return other is KeywordTriggerMetadata &&
        listsEqual(keywordFilter, other.keywordFilter) &&
        listsEqual(regexPatterns, other.regexPatterns) &&
        listsEqual(allowList, other.allowList);
  }
}
