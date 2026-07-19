// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/base_create_message_create_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/thread_auto_archive_duration.dart';
import 'package:meta/meta.dart';

sealed class CreateThreadRequest {
  const CreateThreadRequest();

  factory CreateThreadRequest.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('message')) {
      return CreateForumThreadRequest.fromJson(json);
    }
    if (json.containsKey('invitable')) {
      return CreateTextThreadWithoutMessageRequest.fromJson(json);
    }
    throw FormatException(
      'No variant of CreateThreadRequest matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateThreadRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateThreadRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class CreateForumThreadRequest extends CreateThreadRequest {
  const CreateForumThreadRequest({
    required this.name,
    required this.message,
    this.autoArchiveDuration,
    this.rateLimitPerUser,
    this.appliedTags,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateForumThreadRequest].
  factory CreateForumThreadRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateForumThreadRequest',
      json,
      () => CreateForumThreadRequest(
        name: json['name'] as String,
        autoArchiveDuration: ThreadAutoArchiveDuration.maybeFromJson(
          json['auto_archive_duration'] as int?,
        ),
        rateLimitPerUser: json['rate_limit_per_user'] as int?,
        appliedTags: (json['applied_tags'] as List?)
            ?.map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        message: BaseCreateMessageCreateRequest.fromJson(
          json['message'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateForumThreadRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateForumThreadRequest.fromJson(json);
  }

  final String name;
  final ThreadAutoArchiveDuration? autoArchiveDuration;
  final int? rateLimitPerUser;
  final List<SnowflakeType>? appliedTags;
  final BaseCreateMessageCreateRequest message;

  /// Converts a [CreateForumThreadRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'auto_archive_duration': autoArchiveDuration?.toJson(),
      'rate_limit_per_user': rateLimitPerUser,
      'applied_tags': appliedTags?.map((e) => e.toJson()).toList(),
      'message': message.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    autoArchiveDuration,
    rateLimitPerUser,
    listHash(appliedTags),
    message,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateForumThreadRequest &&
        name == other.name &&
        autoArchiveDuration == other.autoArchiveDuration &&
        rateLimitPerUser == other.rateLimitPerUser &&
        listsEqual(appliedTags, other.appliedTags) &&
        message == other.message;
  }
}

@immutable
final class CreateTextThreadWithoutMessageRequest extends CreateThreadRequest {
  const CreateTextThreadWithoutMessageRequest({
    required this.name,
    this.autoArchiveDuration,
    this.rateLimitPerUser,
    this.type,
    this.invitable,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CreateTextThreadWithoutMessageRequest].
  factory CreateTextThreadWithoutMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CreateTextThreadWithoutMessageRequest',
      json,
      () => CreateTextThreadWithoutMessageRequest(
        name: json['name'] as String,
        autoArchiveDuration: ThreadAutoArchiveDuration.maybeFromJson(
          json['auto_archive_duration'] as int?,
        ),
        rateLimitPerUser: json['rate_limit_per_user'] as int?,
        type: ChannelTypes.maybeFromJson(json['type'] as int?),
        invitable: json['invitable'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateTextThreadWithoutMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateTextThreadWithoutMessageRequest.fromJson(json);
  }

  final String name;
  final ThreadAutoArchiveDuration? autoArchiveDuration;
  final int? rateLimitPerUser;
  final ChannelTypes? type;
  final bool? invitable;

  /// Converts a [CreateTextThreadWithoutMessageRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'auto_archive_duration': autoArchiveDuration?.toJson(),
      'rate_limit_per_user': rateLimitPerUser,
      'type': type?.toJson(),
      'invitable': invitable,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    autoArchiveDuration,
    rateLimitPerUser,
    type,
    invitable,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateTextThreadWithoutMessageRequest &&
        name == other.name &&
        autoArchiveDuration == other.autoArchiveDuration &&
        rateLimitPerUser == other.rateLimitPerUser &&
        type == other.type &&
        invitable == other.invitable;
  }
}
