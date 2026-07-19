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

sealed class GuildAuditLogResponseAutoModerationRulesInner {
  const GuildAuditLogResponseAutoModerationRulesInner();

  factory GuildAuditLogResponseAutoModerationRulesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['trigger_type'];
    return switch (discriminator) {
      4 =>
        GuildAuditLogResponseAutoModerationRulesInnerDefaultKeywordRuleResponse(
          DefaultKeywordRuleResponse.fromJson(json),
        ),
      1 => GuildAuditLogResponseAutoModerationRulesInnerKeywordRuleResponse(
        KeywordRuleResponse.fromJson(json),
      ),
      3 => GuildAuditLogResponseAutoModerationRulesInnerMlSpamRuleResponse(
        MlSpamRuleResponse.fromJson(json),
      ),
      5 => GuildAuditLogResponseAutoModerationRulesInnerMentionSpamRuleResponse(
        MentionSpamRuleResponse.fromJson(json),
      ),
      2 => GuildAuditLogResponseAutoModerationRulesInnerSpamLinkRuleResponse(
        SpamLinkRuleResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown trigger_type '$discriminator' for GuildAuditLogResponseAutoModerationRulesInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildAuditLogResponseAutoModerationRulesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GuildAuditLogResponseAutoModerationRulesInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class GuildAuditLogResponseAutoModerationRulesInnerDefaultKeywordRuleResponse
    extends GuildAuditLogResponseAutoModerationRulesInner {
  const GuildAuditLogResponseAutoModerationRulesInnerDefaultKeywordRuleResponse(
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
            is GuildAuditLogResponseAutoModerationRulesInnerDefaultKeywordRuleResponse &&
        value == other.value;
  }
}

@immutable
final class GuildAuditLogResponseAutoModerationRulesInnerKeywordRuleResponse
    extends GuildAuditLogResponseAutoModerationRulesInner {
  const GuildAuditLogResponseAutoModerationRulesInnerKeywordRuleResponse(
    this.value,
  );

  final KeywordRuleResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is GuildAuditLogResponseAutoModerationRulesInnerKeywordRuleResponse &&
        value == other.value;
  }
}

@immutable
final class GuildAuditLogResponseAutoModerationRulesInnerMlSpamRuleResponse
    extends GuildAuditLogResponseAutoModerationRulesInner {
  const GuildAuditLogResponseAutoModerationRulesInnerMlSpamRuleResponse(
    this.value,
  );

  final MlSpamRuleResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is GuildAuditLogResponseAutoModerationRulesInnerMlSpamRuleResponse &&
        value == other.value;
  }
}

@immutable
final class GuildAuditLogResponseAutoModerationRulesInnerMentionSpamRuleResponse
    extends GuildAuditLogResponseAutoModerationRulesInner {
  const GuildAuditLogResponseAutoModerationRulesInnerMentionSpamRuleResponse(
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
            is GuildAuditLogResponseAutoModerationRulesInnerMentionSpamRuleResponse &&
        value == other.value;
  }
}

@immutable
final class GuildAuditLogResponseAutoModerationRulesInnerSpamLinkRuleResponse
    extends GuildAuditLogResponseAutoModerationRulesInner {
  const GuildAuditLogResponseAutoModerationRulesInnerSpamLinkRuleResponse(
    this.value,
  );

  final SpamLinkRuleResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is GuildAuditLogResponseAutoModerationRulesInnerSpamLinkRuleResponse &&
        value == other.value;
  }
}
