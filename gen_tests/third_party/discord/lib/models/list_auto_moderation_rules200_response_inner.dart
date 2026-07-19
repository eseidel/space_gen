// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/default_keyword_rule_response.dart';
import 'package:discord/messages/keyword_rule_response.dart';
import 'package:discord/messages/mention_spam_rule_response.dart';
import 'package:discord/messages/ml_spam_rule_response.dart';
import 'package:discord/messages/spam_link_rule_response.dart';
import 'package:meta/meta.dart';

sealed class ListAutoModerationRules200ResponseInner {
  const ListAutoModerationRules200ResponseInner();

  factory ListAutoModerationRules200ResponseInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['trigger_type'];
    return switch (discriminator) {
      4 => ListAutoModerationRules200ResponseInnerDefaultKeywordRuleResponse(
        DefaultKeywordRuleResponse.fromJson(json),
      ),
      1 => ListAutoModerationRules200ResponseInnerKeywordRuleResponse(
        KeywordRuleResponse.fromJson(json),
      ),
      3 => ListAutoModerationRules200ResponseInnerMlSpamRuleResponse(
        MlSpamRuleResponse.fromJson(json),
      ),
      5 => ListAutoModerationRules200ResponseInnerMentionSpamRuleResponse(
        MentionSpamRuleResponse.fromJson(json),
      ),
      2 => ListAutoModerationRules200ResponseInnerSpamLinkRuleResponse(
        SpamLinkRuleResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown trigger_type '$discriminator' for ListAutoModerationRules200ResponseInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ListAutoModerationRules200ResponseInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ListAutoModerationRules200ResponseInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ListAutoModerationRules200ResponseInnerDefaultKeywordRuleResponse
    extends ListAutoModerationRules200ResponseInner {
  const ListAutoModerationRules200ResponseInnerDefaultKeywordRuleResponse(
    this.value,
  );

  final DefaultKeywordRuleResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ListAutoModerationRules200ResponseInnerDefaultKeywordRuleResponse &&
        value == other.value;
  }
}

@immutable
final class ListAutoModerationRules200ResponseInnerKeywordRuleResponse
    extends ListAutoModerationRules200ResponseInner {
  const ListAutoModerationRules200ResponseInnerKeywordRuleResponse(this.value);

  final KeywordRuleResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ListAutoModerationRules200ResponseInnerKeywordRuleResponse &&
        value == other.value;
  }
}

@immutable
final class ListAutoModerationRules200ResponseInnerMlSpamRuleResponse
    extends ListAutoModerationRules200ResponseInner {
  const ListAutoModerationRules200ResponseInnerMlSpamRuleResponse(this.value);

  final MlSpamRuleResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ListAutoModerationRules200ResponseInnerMlSpamRuleResponse &&
        value == other.value;
  }
}

@immutable
final class ListAutoModerationRules200ResponseInnerMentionSpamRuleResponse
    extends ListAutoModerationRules200ResponseInner {
  const ListAutoModerationRules200ResponseInnerMentionSpamRuleResponse(
    this.value,
  );

  final MentionSpamRuleResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ListAutoModerationRules200ResponseInnerMentionSpamRuleResponse &&
        value == other.value;
  }
}

@immutable
final class ListAutoModerationRules200ResponseInnerSpamLinkRuleResponse
    extends ListAutoModerationRules200ResponseInner {
  const ListAutoModerationRules200ResponseInnerSpamLinkRuleResponse(this.value);

  final SpamLinkRuleResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ListAutoModerationRules200ResponseInnerSpamLinkRuleResponse &&
        value == other.value;
  }
}
