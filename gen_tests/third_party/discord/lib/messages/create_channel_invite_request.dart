import 'package:discord/model_helpers.dart';
import 'package:discord/models/invite_target_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class CreateChannelInviteRequest {
  const CreateChannelInviteRequest();

  factory CreateChannelInviteRequest.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('max_uses')) {
      return CreateGuildInviteRequest.fromJson(json);
    }
    return CreateGroupDmInviteRequest.fromJson(json);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateChannelInviteRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateChannelInviteRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class CreateGroupDmInviteRequest extends CreateChannelInviteRequest {
  const CreateGroupDmInviteRequest({this.maxAge});

  /// Converts a `Map<String, dynamic>` to a [CreateGroupDmInviteRequest].
  factory CreateGroupDmInviteRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateGroupDmInviteRequest',
      json,
      () => CreateGroupDmInviteRequest(maxAge: json['max_age'] as int?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateGroupDmInviteRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateGroupDmInviteRequest.fromJson(json);
  }

  final int? maxAge;

  /// Converts a [CreateGroupDmInviteRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'max_age': maxAge};
  }

  @override
  int get hashCode => maxAge.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateGroupDmInviteRequest && maxAge == other.maxAge;
  }
}

@immutable
final class CreateGuildInviteRequest extends CreateChannelInviteRequest {
  const CreateGuildInviteRequest({
    this.maxAge,
    this.temporary,
    this.maxUses,
    this.unique,
    this.targetUserId,
    this.targetApplicationId,
    this.targetType,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateGuildInviteRequest].
  factory CreateGuildInviteRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateGuildInviteRequest',
      json,
      () => CreateGuildInviteRequest(
        maxAge: json['max_age'] as int?,
        temporary: json['temporary'] as bool?,
        maxUses: json['max_uses'] as int?,
        unique: json['unique'] as bool?,
        targetUserId: SnowflakeType.maybeFromJson(
          json['target_user_id'] as String?,
        ),
        targetApplicationId: SnowflakeType.maybeFromJson(
          json['target_application_id'] as String?,
        ),
        targetType: InviteTargetTypes.maybeFromJson(
          json['target_type'] as int?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateGuildInviteRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateGuildInviteRequest.fromJson(json);
  }

  final int? maxAge;
  final bool? temporary;
  final int? maxUses;
  final bool? unique;
  final SnowflakeType? targetUserId;
  final SnowflakeType? targetApplicationId;
  final InviteTargetTypes? targetType;

  /// Converts a [CreateGuildInviteRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'max_age': maxAge,
      'temporary': temporary,
      'max_uses': maxUses,
      'unique': unique,
      'target_user_id': targetUserId?.toJson(),
      'target_application_id': targetApplicationId?.toJson(),
      'target_type': targetType?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    maxAge,
    temporary,
    maxUses,
    unique,
    targetUserId,
    targetApplicationId,
    targetType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateGuildInviteRequest &&
        maxAge == other.maxAge &&
        temporary == other.temporary &&
        maxUses == other.maxUses &&
        unique == other.unique &&
        targetUserId == other.targetUserId &&
        targetApplicationId == other.targetApplicationId &&
        targetType == other.targetType;
  }
}
