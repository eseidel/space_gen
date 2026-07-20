// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:discord/api_client.dart';
import 'package:discord/api_exception.dart';
import 'package:discord/messages/activities_attachment_response.dart';
import 'package:discord/messages/add_group_dm_user201_response.dart';
import 'package:discord/messages/add_group_dm_user_request.dart';
import 'package:discord/messages/add_lobby_member_request.dart';
import 'package:discord/messages/application_command_create_request.dart';
import 'package:discord/messages/application_command_response.dart';
import 'package:discord/messages/application_command_update_request.dart';
import 'package:discord/messages/application_role_connections_metadata_item_request.dart';
import 'package:discord/messages/application_role_connections_metadata_item_response.dart';
import 'package:discord/messages/application_user_role_connection_response.dart';
import 'package:discord/messages/ban_user_from_guild_request.dart';
import 'package:discord/messages/bot_account_patch_request.dart';
import 'package:discord/messages/bot_add_guild_member_request.dart';
import 'package:discord/messages/bot_partner_sdk_token_request.dart';
import 'package:discord/messages/bot_partner_sdk_unmerge_provisional_account_request.dart';
import 'package:discord/messages/bulk_ban_users_request.dart';
import 'package:discord/messages/bulk_ban_users_response.dart';
import 'package:discord/messages/bulk_delete_messages_request.dart';
import 'package:discord/messages/bulk_lobby_member_request.dart';
import 'package:discord/messages/channel_follower_response.dart';
import 'package:discord/messages/command_permissions_response.dart';
import 'package:discord/messages/connected_account_response.dart';
import 'package:discord/messages/create_application_emoji_request.dart';
import 'package:discord/messages/create_auto_moderation_rule_request.dart';
import 'package:discord/messages/create_channel_invite_request.dart';
import 'package:discord/messages/create_guild_channel_request.dart';
import 'package:discord/messages/create_guild_emoji_request.dart';
import 'package:discord/messages/create_guild_scheduled_event_request.dart';
import 'package:discord/messages/create_guild_sticker_request.dart';
import 'package:discord/messages/create_guild_template_request.dart';
import 'package:discord/messages/create_interaction_response_request.dart';
import 'package:discord/messages/create_lobby_request.dart';
import 'package:discord/messages/create_or_join_lobby_request.dart';
import 'package:discord/messages/create_private_channel_request.dart';
import 'package:discord/messages/create_role_request.dart';
import 'package:discord/messages/create_stage_instance_request.dart';
import 'package:discord/messages/create_text_thread_with_message_request.dart';
import 'package:discord/messages/create_thread_request.dart';
import 'package:discord/messages/create_webhook_request.dart';
import 'package:discord/messages/created_thread_response.dart';
import 'package:discord/messages/edit_lobby_channel_link_request.dart';
import 'package:discord/messages/edit_lobby_request.dart';
import 'package:discord/messages/emoji_response.dart';
import 'package:discord/messages/entitlement_response.dart';
import 'package:discord/messages/error_response.dart';
import 'package:discord/messages/execute_webhook_request.dart';
import 'package:discord/messages/follow_channel_request.dart';
import 'package:discord/messages/gateway_bot_response.dart';
import 'package:discord/messages/gateway_response.dart';
import 'package:discord/messages/get_channel200_response.dart';
import 'package:discord/messages/get_sticker200_response.dart';
import 'package:discord/messages/guild_audit_log_response.dart';
import 'package:discord/messages/guild_ban_response.dart';
import 'package:discord/messages/guild_channel_response.dart';
import 'package:discord/messages/guild_home_settings_response.dart';
import 'package:discord/messages/guild_incoming_webhook_response.dart';
import 'package:discord/messages/guild_member_response.dart';
import 'package:discord/messages/guild_onboarding_response.dart';
import 'package:discord/messages/guild_preview_response.dart';
import 'package:discord/messages/guild_prune_response.dart';
import 'package:discord/messages/guild_response.dart';
import 'package:discord/messages/guild_role_response.dart';
import 'package:discord/messages/guild_search_response.dart';
import 'package:discord/messages/guild_sticker_response.dart';
import 'package:discord/messages/guild_template_response.dart';
import 'package:discord/messages/guild_welcome_screen_response.dart';
import 'package:discord/messages/guild_with_counts_response.dart';
import 'package:discord/messages/interaction_callback_response.dart';
import 'package:discord/messages/list_application_emojis_response.dart';
import 'package:discord/messages/list_guild_soundboard_sounds_response.dart';
import 'package:discord/messages/lobby_guild_invite_response.dart';
import 'package:discord/messages/lobby_member_response.dart';
import 'package:discord/messages/lobby_message_response.dart';
import 'package:discord/messages/lobby_response.dart';
import 'package:discord/messages/message_create_request.dart';
import 'package:discord/messages/message_response.dart';
import 'package:discord/messages/my_guild_response.dart';
import 'package:discord/messages/o_auth2_get_authorization_response.dart';
import 'package:discord/messages/o_auth2_get_open_id_connect_user_info_response.dart';
import 'package:discord/messages/partner_sdk_token_request.dart';
import 'package:discord/messages/partner_sdk_unmerge_provisional_account_request.dart';
import 'package:discord/messages/pinned_messages_response.dart';
import 'package:discord/messages/poll_answer_details_response.dart';
import 'package:discord/messages/private_application_response.dart';
import 'package:discord/messages/private_guild_member_response.dart';
import 'package:discord/messages/provisional_token_response.dart';
import 'package:discord/messages/prune_guild_request.dart';
import 'package:discord/messages/scheduled_event_user_response.dart';
import 'package:discord/messages/sdk_message_request.dart';
import 'package:discord/messages/search_index_not_ready_response.dart';
import 'package:discord/messages/set_channel_permission_overwrite_request.dart';
import 'package:discord/messages/set_guild_application_command_permissions_request.dart';
import 'package:discord/messages/soundboard_create_request.dart';
import 'package:discord/messages/soundboard_sound_response.dart';
import 'package:discord/messages/soundboard_sound_send_request.dart';
import 'package:discord/messages/stage_instance_response.dart';
import 'package:discord/messages/sticker_pack_collection_response.dart';
import 'package:discord/messages/sticker_pack_response.dart';
import 'package:discord/messages/target_users_job_status_response.dart';
import 'package:discord/messages/thread_member_response.dart';
import 'package:discord/messages/thread_response.dart';
import 'package:discord/messages/thread_search_response.dart';
import 'package:discord/messages/threads_response.dart';
import 'package:discord/messages/typing_indicator_response.dart';
import 'package:discord/messages/unban_user_from_guild_request.dart';
import 'package:discord/messages/update_application_emoji_request.dart';
import 'package:discord/messages/update_application_user_role_connection_request.dart';
import 'package:discord/messages/update_auto_moderation_rule_request.dart';
import 'package:discord/messages/update_channel_request.dart';
import 'package:discord/messages/update_guild_emoji_request.dart';
import 'package:discord/messages/update_guild_member_request.dart';
import 'package:discord/messages/update_guild_onboarding_request.dart';
import 'package:discord/messages/update_guild_scheduled_event_request.dart';
import 'package:discord/messages/update_guild_sticker_request.dart';
import 'package:discord/messages/update_guild_template_request.dart';
import 'package:discord/messages/update_guild_widget_settings_request.dart';
import 'package:discord/messages/update_invite_target_users_request.dart';
import 'package:discord/messages/update_my_guild_member_request.dart';
import 'package:discord/messages/update_role_positions_request.dart';
import 'package:discord/messages/update_stage_instance_request.dart';
import 'package:discord/messages/update_voice_channel_status_request.dart';
import 'package:discord/messages/update_webhook_by_token_request.dart';
import 'package:discord/messages/update_webhook_request.dart';
import 'package:discord/messages/upload_application_attachment_request.dart';
import 'package:discord/messages/user_guild_onboarding_response.dart';
import 'package:discord/messages/user_pii_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/messages/vanity_url_response.dart';
import 'package:discord/messages/voice_region_response.dart';
import 'package:discord/messages/voice_state_response.dart';
import 'package:discord/messages/widget_response.dart';
import 'package:discord/messages/widget_settings_response.dart';
import 'package:discord/models/application_command_patch_request_partial.dart';
import 'package:discord/models/application_form_partial.dart';
import 'package:discord/models/audit_log_action_types.dart';
import 'package:discord/models/author_type.dart';
import 'package:discord/models/bulk_update_guild_channels_request_inner.dart';
import 'package:discord/models/create_entitlement_request_data.dart';
import 'package:discord/models/embedded_activity_instance.dart';
import 'package:discord/models/get_current_user_application_entitlements_parameter0.dart';
import 'package:discord/models/get_entitlements_parameter1.dart';
import 'package:discord/models/github_webhook.dart';
import 'package:discord/models/guild_patch_request_partial.dart';
import 'package:discord/models/has_option.dart';
import 'package:discord/models/incoming_webhook_update_request_partial.dart';
import 'package:discord/models/list_auto_moderation_rules200_response_inner.dart';
import 'package:discord/models/list_channel_invites200_response_inner.dart';
import 'package:discord/models/list_channel_webhooks200_response_inner.dart';
import 'package:discord/models/list_guild_integrations200_response_inner.dart';
import 'package:discord/models/list_guild_scheduled_events200_response_inner.dart';
import 'package:discord/models/message_edit_request_partial.dart';
import 'package:discord/models/o_auth2_get_keys.dart';
import 'package:discord/models/preview_prune_guild_parameter1.dart';
import 'package:discord/models/reaction_types.dart';
import 'package:discord/models/searchable_embed_type.dart';
import 'package:discord/models/slack_webhook.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:discord/models/sorting_mode.dart';
import 'package:discord/models/sorting_order.dart';
import 'package:discord/models/soundboard_patch_request_partial.dart';
import 'package:discord/models/thread_search_parameter4.dart';
import 'package:discord/models/thread_search_tag_setting.dart';
import 'package:discord/models/thread_sorting_mode.dart';
import 'package:discord/models/update_role_request_partial.dart';
import 'package:discord/models/update_self_voice_state_request_partial.dart';
import 'package:discord/models/update_voice_state_request_partial.dart';
import 'package:discord/models/welcome_screen_patch_request_partial.dart';
import 'package:discord/models/widget_image_styles.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

sealed class CreateChannelInviteResponse {
  const CreateChannelInviteResponse();
}

@immutable
final class CreateChannelInviteResponse200 extends CreateChannelInviteResponse {
  const CreateChannelInviteResponse200(this.value);

  final ListChannelInvites200ResponseInner value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateChannelInviteResponse200 && value == other.value;
  }
}

@immutable
final class CreateChannelInviteResponse204 extends CreateChannelInviteResponse {
  const CreateChannelInviteResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is CreateChannelInviteResponse204;
}

sealed class AddGroupDmUserResponse {
  const AddGroupDmUserResponse();
}

@immutable
final class AddGroupDmUserResponse201 extends AddGroupDmUserResponse {
  const AddGroupDmUserResponse201(this.value);

  final AddGroupDmUser201Response value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddGroupDmUserResponse201 && value == other.value;
  }
}

@immutable
final class AddGroupDmUserResponse204 extends AddGroupDmUserResponse {
  const AddGroupDmUserResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is AddGroupDmUserResponse204;
}

sealed class ThreadSearchResponse2 {
  const ThreadSearchResponse2();
}

@immutable
final class ThreadSearchResponse2200 extends ThreadSearchResponse2 {
  const ThreadSearchResponse2200(this.value);

  final ThreadSearchResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadSearchResponse2200 && value == other.value;
  }
}

@immutable
final class ThreadSearchResponse2202 extends ThreadSearchResponse2 {
  const ThreadSearchResponse2202(this.value);

  final SearchIndexNotReadyResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadSearchResponse2202 && value == other.value;
  }
}

sealed class TriggerTypingIndicatorResponse {
  const TriggerTypingIndicatorResponse();
}

@immutable
final class TriggerTypingIndicatorResponse200
    extends TriggerTypingIndicatorResponse {
  const TriggerTypingIndicatorResponse200(this.value);

  final TypingIndicatorResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TriggerTypingIndicatorResponse200 && value == other.value;
  }
}

@immutable
final class TriggerTypingIndicatorResponse204
    extends TriggerTypingIndicatorResponse {
  const TriggerTypingIndicatorResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is TriggerTypingIndicatorResponse204;
}

sealed class BulkBanUsersFromGuildResponse {
  const BulkBanUsersFromGuildResponse();
}

@immutable
final class BulkBanUsersFromGuildResponse200
    extends BulkBanUsersFromGuildResponse {
  const BulkBanUsersFromGuildResponse200(this.value);

  final BulkBanUsersResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BulkBanUsersFromGuildResponse200 && value == other.value;
  }
}

@immutable
final class BulkBanUsersFromGuildResponse204
    extends BulkBanUsersFromGuildResponse {
  const BulkBanUsersFromGuildResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is BulkBanUsersFromGuildResponse204;
}

sealed class AddGuildMemberResponse {
  const AddGuildMemberResponse();
}

@immutable
final class AddGuildMemberResponse201 extends AddGuildMemberResponse {
  const AddGuildMemberResponse201(this.value);

  final GuildMemberResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddGuildMemberResponse201 && value == other.value;
  }
}

@immutable
final class AddGuildMemberResponse204 extends AddGuildMemberResponse {
  const AddGuildMemberResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is AddGuildMemberResponse204;
}

sealed class UpdateGuildMemberResponse {
  const UpdateGuildMemberResponse();
}

@immutable
final class UpdateGuildMemberResponse200 extends UpdateGuildMemberResponse {
  const UpdateGuildMemberResponse200(this.value);

  final GuildMemberResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateGuildMemberResponse200 && value == other.value;
  }
}

@immutable
final class UpdateGuildMemberResponse204 extends UpdateGuildMemberResponse {
  const UpdateGuildMemberResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is UpdateGuildMemberResponse204;
}

sealed class GuildSearchResponse2 {
  const GuildSearchResponse2();
}

@immutable
final class GuildSearchResponse2200 extends GuildSearchResponse2 {
  const GuildSearchResponse2200(this.value);

  final GuildSearchResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildSearchResponse2200 && value == other.value;
  }
}

@immutable
final class GuildSearchResponse2202 extends GuildSearchResponse2 {
  const GuildSearchResponse2202(this.value);

  final SearchIndexNotReadyResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildSearchResponse2202 && value == other.value;
  }
}

sealed class GetGuildNewMemberWelcomeResponse {
  const GetGuildNewMemberWelcomeResponse();
}

@immutable
final class GetGuildNewMemberWelcomeResponse200
    extends GetGuildNewMemberWelcomeResponse {
  const GetGuildNewMemberWelcomeResponse200(this.value);

  final GuildHomeSettingsResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetGuildNewMemberWelcomeResponse200 && value == other.value;
  }
}

@immutable
final class GetGuildNewMemberWelcomeResponse204
    extends GetGuildNewMemberWelcomeResponse {
  const GetGuildNewMemberWelcomeResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is GetGuildNewMemberWelcomeResponse204;
}

sealed class CreateInteractionResponseResponse {
  const CreateInteractionResponseResponse();
}

@immutable
final class CreateInteractionResponseResponse200
    extends CreateInteractionResponseResponse {
  const CreateInteractionResponseResponse200(this.value);

  final InteractionCallbackResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateInteractionResponseResponse200 &&
        value == other.value;
  }
}

@immutable
final class CreateInteractionResponseResponse204
    extends CreateInteractionResponseResponse {
  const CreateInteractionResponseResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is CreateInteractionResponseResponse204;
}

sealed class ExecuteWebhookResponse {
  const ExecuteWebhookResponse();
}

@immutable
final class ExecuteWebhookResponse200 extends ExecuteWebhookResponse {
  const ExecuteWebhookResponse200(this.value);

  final MessageResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExecuteWebhookResponse200 && value == other.value;
  }
}

@immutable
final class ExecuteWebhookResponse204 extends ExecuteWebhookResponse {
  const ExecuteWebhookResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is ExecuteWebhookResponse204;
}

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<PrivateApplicationResponse> getMyApplication() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/@me',
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return PrivateApplicationResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<PrivateApplicationResponse> updateMyApplication(
    ApplicationFormPartial applicationFormPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/applications/@me',
      body: applicationFormPartial.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return PrivateApplicationResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<PrivateApplicationResponse> getApplication(
    SnowflakeType applicationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return PrivateApplicationResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<PrivateApplicationResponse> updateApplication(
    SnowflakeType applicationId,
    ApplicationFormPartial applicationFormPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/applications/{application_id}'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      body: applicationFormPartial.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return PrivateApplicationResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<EmbeddedActivityInstance> applicationsGetActivityInstance(
    SnowflakeType applicationId,
    String instanceId,
  ) async {
    instanceId.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}/activity-instances/{instance_id}'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{instance_id}', Uri.encodeComponent(instanceId)),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return EmbeddedActivityInstance.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ActivitiesAttachmentResponse> uploadApplicationAttachment(
    SnowflakeType applicationId,
    UploadApplicationAttachmentRequest uploadApplicationAttachmentRequest,
  ) async {
    final multipartFields = <String, String>{};
    final multipartFiles = <http.MultipartFile>[
      http.MultipartFile.fromBytes(
        'file',
        uploadApplicationAttachmentRequest.file,
        filename: 'file',
      ),
    ];
    final response = await client.invokeApiMultipart(
      method: Method.post,
      path: '/applications/{application_id}/attachment'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      fields: multipartFields,
      files: multipartFiles,
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ActivitiesAttachmentResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ApplicationCommandResponse>> listApplicationCommands(
    SnowflakeType applicationId, {
    bool? withLocalizations,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}/commands'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      queryParameters: {
        if (withLocalizations != null)
          'with_localizations': [withLocalizations.toString()],
      },
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ApplicationCommandResponse>(
            (e) =>
                ApplicationCommandResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ApplicationCommandResponse> createApplicationCommand(
    SnowflakeType applicationId,
    ApplicationCommandCreateRequest applicationCommandCreateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/applications/{application_id}/commands'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      body: applicationCommandCreateRequest.toJson(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ApplicationCommandResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ApplicationCommandResponse>> bulkSetApplicationCommands(
    SnowflakeType applicationId,
    List<ApplicationCommandUpdateRequest> list,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/applications/{application_id}/commands'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      body: list.map((e) => e.toJson()).toList(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ApplicationCommandResponse>(
            (e) =>
                ApplicationCommandResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ApplicationCommandResponse> getApplicationCommand(
    SnowflakeType applicationId,
    SnowflakeType commandId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}/commands/{command_id}'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{command_id}', Uri.encodeComponent(commandId.toJson())),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ApplicationCommandResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteApplicationCommand(
    SnowflakeType applicationId,
    SnowflakeType commandId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/applications/{application_id}/commands/{command_id}'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{command_id}', Uri.encodeComponent(commandId.toJson())),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<ApplicationCommandResponse> updateApplicationCommand(
    SnowflakeType applicationId,
    SnowflakeType commandId,
    ApplicationCommandPatchRequestPartial applicationCommandPatchRequestPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/applications/{application_id}/commands/{command_id}'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{command_id}', Uri.encodeComponent(commandId.toJson())),
      body: applicationCommandPatchRequestPartial.toJson(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ApplicationCommandResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ListApplicationEmojisResponse> listApplicationEmojis(
    SnowflakeType applicationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}/emojis'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListApplicationEmojisResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<EmojiResponse> createApplicationEmoji(
    SnowflakeType applicationId,
    CreateApplicationEmojiRequest createApplicationEmojiRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/applications/{application_id}/emojis'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      body: createApplicationEmojiRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return EmojiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<EmojiResponse> getApplicationEmoji(
    SnowflakeType applicationId,
    SnowflakeType emojiId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}/emojis/{emoji_id}'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{emoji_id}', Uri.encodeComponent(emojiId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return EmojiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteApplicationEmoji(
    SnowflakeType applicationId,
    SnowflakeType emojiId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/applications/{application_id}/emojis/{emoji_id}'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{emoji_id}', Uri.encodeComponent(emojiId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<EmojiResponse> updateApplicationEmoji(
    SnowflakeType applicationId,
    SnowflakeType emojiId,
    UpdateApplicationEmojiRequest updateApplicationEmojiRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/applications/{application_id}/emojis/{emoji_id}'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{emoji_id}', Uri.encodeComponent(emojiId.toJson())),
      body: updateApplicationEmojiRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return EmojiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<EntitlementResponse>> getEntitlements(
    SnowflakeType applicationId, {
    SnowflakeType? userId,
    GetEntitlementsParameter1? skuIds,
    SnowflakeType? guildId,
    SnowflakeType? before,
    SnowflakeType? after,
    int? limit,
    bool? excludeEnded,
    bool? excludeDeleted,
    bool? onlyActive,
  }) async {
    limit?.validate(min: 1, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}/entitlements'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      queryParameters: {
        if (userId != null) 'user_id': [userId.toJson()],
        if (skuIds != null)
          'sku_ids': switch (skuIds) {
            GetEntitlementsParameter1String(:final value) => [value],
            GetEntitlementsParameter1List(:final value) =>
              value.map((e) => e.toJson()).toList(),
          },
        if (guildId != null) 'guild_id': [guildId.toJson()],
        if (before != null) 'before': [before.toJson()],
        if (after != null) 'after': [after.toJson()],
        if (limit != null) 'limit': [limit.toString()],
        if (excludeEnded != null) 'exclude_ended': [excludeEnded.toString()],
        if (excludeDeleted != null)
          'exclude_deleted': [excludeDeleted.toString()],
        if (onlyActive != null) 'only_active': [onlyActive.toString()],
      },
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<EntitlementResponse>(
            (e) => EntitlementResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<EntitlementResponse> createEntitlement(
    SnowflakeType applicationId,
    CreateEntitlementRequestData createEntitlementRequestData,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/applications/{application_id}/entitlements'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      body: createEntitlementRequestData.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return EntitlementResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<EntitlementResponse> getEntitlement(
    SnowflakeType applicationId,
    SnowflakeType entitlementId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}/entitlements/{entitlement_id}'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll(
            '{entitlement_id}',
            Uri.encodeComponent(entitlementId.toJson()),
          ),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return EntitlementResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteEntitlement(
    SnowflakeType applicationId,
    SnowflakeType entitlementId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/applications/{application_id}/entitlements/{entitlement_id}'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll(
            '{entitlement_id}',
            Uri.encodeComponent(entitlementId.toJson()),
          ),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> consumeEntitlement(
    SnowflakeType applicationId,
    SnowflakeType entitlementId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/applications/{application_id}/entitlements/{entitlement_id}/consume'
              .replaceAll(
                '{application_id}',
                Uri.encodeComponent(applicationId.toJson()),
              )
              .replaceAll(
                '{entitlement_id}',
                Uri.encodeComponent(entitlementId.toJson()),
              ),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<List<ApplicationCommandResponse>> listGuildApplicationCommands(
    SnowflakeType applicationId,
    SnowflakeType guildId, {
    bool? withLocalizations,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}/guilds/{guild_id}/commands'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson())),
      queryParameters: {
        if (withLocalizations != null)
          'with_localizations': [withLocalizations.toString()],
      },
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ApplicationCommandResponse>(
            (e) =>
                ApplicationCommandResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ApplicationCommandResponse> createGuildApplicationCommand(
    SnowflakeType applicationId,
    SnowflakeType guildId,
    ApplicationCommandCreateRequest applicationCommandCreateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/applications/{application_id}/guilds/{guild_id}/commands'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson())),
      body: applicationCommandCreateRequest.toJson(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ApplicationCommandResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ApplicationCommandResponse>> bulkSetGuildApplicationCommands(
    SnowflakeType applicationId,
    SnowflakeType guildId,
    List<ApplicationCommandUpdateRequest> list,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/applications/{application_id}/guilds/{guild_id}/commands'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          )
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson())),
      body: list.map((e) => e.toJson()).toList(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ApplicationCommandResponse>(
            (e) =>
                ApplicationCommandResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<CommandPermissionsResponse>>
  listGuildApplicationCommandPermissions(
    SnowflakeType applicationId,
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/applications/{application_id}/guilds/{guild_id}/commands/permissions'
              .replaceAll(
                '{application_id}',
                Uri.encodeComponent(applicationId.toJson()),
              )
              .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson())),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CommandPermissionsResponse>(
            (e) =>
                CommandPermissionsResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ApplicationCommandResponse> getGuildApplicationCommand(
    SnowflakeType applicationId,
    SnowflakeType guildId,
    SnowflakeType commandId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/applications/{application_id}/guilds/{guild_id}/commands/{command_id}'
              .replaceAll(
                '{application_id}',
                Uri.encodeComponent(applicationId.toJson()),
              )
              .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
              .replaceAll(
                '{command_id}',
                Uri.encodeComponent(commandId.toJson()),
              ),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ApplicationCommandResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteGuildApplicationCommand(
    SnowflakeType applicationId,
    SnowflakeType guildId,
    SnowflakeType commandId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/applications/{application_id}/guilds/{guild_id}/commands/{command_id}'
              .replaceAll(
                '{application_id}',
                Uri.encodeComponent(applicationId.toJson()),
              )
              .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
              .replaceAll(
                '{command_id}',
                Uri.encodeComponent(commandId.toJson()),
              ),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<ApplicationCommandResponse> updateGuildApplicationCommand(
    SnowflakeType applicationId,
    SnowflakeType guildId,
    SnowflakeType commandId,
    ApplicationCommandPatchRequestPartial applicationCommandPatchRequestPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path:
          '/applications/{application_id}/guilds/{guild_id}/commands/{command_id}'
              .replaceAll(
                '{application_id}',
                Uri.encodeComponent(applicationId.toJson()),
              )
              .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
              .replaceAll(
                '{command_id}',
                Uri.encodeComponent(commandId.toJson()),
              ),
      body: applicationCommandPatchRequestPartial.toJson(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ApplicationCommandResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<CommandPermissionsResponse> getGuildApplicationCommandPermissions(
    SnowflakeType applicationId,
    SnowflakeType guildId,
    SnowflakeType commandId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions'
              .replaceAll(
                '{application_id}',
                Uri.encodeComponent(applicationId.toJson()),
              )
              .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
              .replaceAll(
                '{command_id}',
                Uri.encodeComponent(commandId.toJson()),
              ),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return CommandPermissionsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<CommandPermissionsResponse> setGuildApplicationCommandPermissions(
    SnowflakeType applicationId,
    SnowflakeType guildId,
    SnowflakeType commandId,
    SetGuildApplicationCommandPermissionsRequest
    setGuildApplicationCommandPermissionsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions'
              .replaceAll(
                '{application_id}',
                Uri.encodeComponent(applicationId.toJson()),
              )
              .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
              .replaceAll(
                '{command_id}',
                Uri.encodeComponent(commandId.toJson()),
              ),
      body: setGuildApplicationCommandPermissionsRequest.toJson(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return CommandPermissionsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ApplicationRoleConnectionsMetadataItemResponse>>
  getApplicationRoleConnectionsMetadata(SnowflakeType applicationId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/applications/{application_id}/role-connections/metadata'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ApplicationRoleConnectionsMetadataItemResponse>(
            (e) => ApplicationRoleConnectionsMetadataItemResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ApplicationRoleConnectionsMetadataItemResponse>>
  updateApplicationRoleConnectionsMetadata(
    SnowflakeType applicationId,
    List<ApplicationRoleConnectionsMetadataItemRequest> list,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/applications/{application_id}/role-connections/metadata'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          ),
      body: list.map((e) => e.toJson()).toList(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ApplicationRoleConnectionsMetadataItemResponse>(
            (e) => ApplicationRoleConnectionsMetadataItemResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GetChannel200Response> getChannel(SnowflakeType channelId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GetChannel200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GetChannel200Response> deleteChannel(SnowflakeType channelId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/channels/{channel_id}'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GetChannel200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GetChannel200Response> updateChannel(
    SnowflakeType channelId,
    UpdateChannelRequest updateChannelRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/channels/{channel_id}'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: updateChannelRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GetChannel200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ChannelFollowerResponse> followChannel(
    SnowflakeType channelId,
    FollowChannelRequest followChannelRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/followers'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: followChannelRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ChannelFollowerResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ListChannelInvites200ResponseInner>> listChannelInvites(
    SnowflakeType channelId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/invites'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ListChannelInvites200ResponseInner>(
            (e) => ListChannelInvites200ResponseInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<CreateChannelInviteResponse> createChannelInvite(
    SnowflakeType channelId,
    CreateChannelInviteRequest createChannelInviteRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/invites'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: createChannelInviteRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      200 => CreateChannelInviteResponse200(
        ListChannelInvites200ResponseInner.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const CreateChannelInviteResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<List<MessageResponse>> listMessages(
    SnowflakeType channelId, {
    SnowflakeType? around,
    SnowflakeType? before,
    SnowflakeType? after,
    int? limit,
  }) async {
    limit?.validate(min: 1, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/messages'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      queryParameters: {
        if (around != null) 'around': [around.toJson()],
        if (before != null) 'before': [before.toJson()],
        if (after != null) 'after': [after.toJson()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<MessageResponse>(
            (e) => MessageResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<MessageResponse> createMessage(
    SnowflakeType channelId,
    MessageCreateRequest messageCreateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/messages'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: messageCreateRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return MessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> bulkDeleteMessages(
    SnowflakeType channelId,
    BulkDeleteMessagesRequest bulkDeleteMessagesRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/messages/bulk-delete'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: bulkDeleteMessagesRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<PinnedMessagesResponse> listPins(
    SnowflakeType channelId, {
    DateTime? before,
    int? limit,
  }) async {
    limit?.validate(min: 1, max: 50);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/messages/pins'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      queryParameters: {
        if (before != null) 'before': [before.toIso8601String()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return PinnedMessagesResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> createPin(
    SnowflakeType channelId,
    SnowflakeType messageId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/channels/{channel_id}/messages/pins/{message_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> deletePin(
    SnowflakeType channelId,
    SnowflakeType messageId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/channels/{channel_id}/messages/pins/{message_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<MessageResponse> getMessage(
    SnowflakeType channelId,
    SnowflakeType messageId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/messages/{message_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return MessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteMessage(
    SnowflakeType channelId,
    SnowflakeType messageId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/channels/{channel_id}/messages/{message_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<MessageResponse> updateMessage(
    SnowflakeType channelId,
    SnowflakeType messageId,
    MessageEditRequestPartial messageEditRequestPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/channels/{channel_id}/messages/{message_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      body: messageEditRequestPartial.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return MessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<MessageResponse> crosspostMessage(
    SnowflakeType channelId,
    SnowflakeType messageId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/messages/{message_id}/crosspost'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return MessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteAllMessageReactions(
    SnowflakeType channelId,
    SnowflakeType messageId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/channels/{channel_id}/messages/{message_id}/reactions'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<List<UserResponse>> listMessageReactionsByEmoji(
    SnowflakeType channelId,
    SnowflakeType messageId,
    String emojiName, {
    SnowflakeType? after,
    int? limit,
    ReactionTypes? type,
  }) async {
    emojiName.validate(maxLength: 152133);
    limit?.validate(min: 1, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}'
              .replaceAll(
                '{channel_id}',
                Uri.encodeComponent(channelId.toJson()),
              )
              .replaceAll(
                '{message_id}',
                Uri.encodeComponent(messageId.toJson()),
              )
              .replaceAll('{emoji_name}', Uri.encodeComponent(emojiName)),
      queryParameters: {
        if (after != null) 'after': [after.toJson()],
        if (limit != null) 'limit': [limit.toString()],
        if (type != null) 'type': [type.toJson().toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<UserResponse>(
            (e) => UserResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteAllMessageReactionsByEmoji(
    SnowflakeType channelId,
    SnowflakeType messageId,
    String emojiName,
  ) async {
    emojiName.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}'
              .replaceAll(
                '{channel_id}',
                Uri.encodeComponent(channelId.toJson()),
              )
              .replaceAll(
                '{message_id}',
                Uri.encodeComponent(messageId.toJson()),
              )
              .replaceAll('{emoji_name}', Uri.encodeComponent(emojiName)),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> addMyMessageReaction(
    SnowflakeType channelId,
    SnowflakeType messageId,
    String emojiName,
  ) async {
    emojiName.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me'
              .replaceAll(
                '{channel_id}',
                Uri.encodeComponent(channelId.toJson()),
              )
              .replaceAll(
                '{message_id}',
                Uri.encodeComponent(messageId.toJson()),
              )
              .replaceAll('{emoji_name}', Uri.encodeComponent(emojiName)),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> deleteMyMessageReaction(
    SnowflakeType channelId,
    SnowflakeType messageId,
    String emojiName,
  ) async {
    emojiName.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me'
              .replaceAll(
                '{channel_id}',
                Uri.encodeComponent(channelId.toJson()),
              )
              .replaceAll(
                '{message_id}',
                Uri.encodeComponent(messageId.toJson()),
              )
              .replaceAll('{emoji_name}', Uri.encodeComponent(emojiName)),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> deleteUserMessageReaction(
    SnowflakeType channelId,
    SnowflakeType messageId,
    String emojiName,
    SnowflakeType userId,
  ) async {
    emojiName.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/{user_id}'
              .replaceAll(
                '{channel_id}',
                Uri.encodeComponent(channelId.toJson()),
              )
              .replaceAll(
                '{message_id}',
                Uri.encodeComponent(messageId.toJson()),
              )
              .replaceAll('{emoji_name}', Uri.encodeComponent(emojiName))
              .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<ThreadResponse> createThreadFromMessage(
    SnowflakeType channelId,
    SnowflakeType messageId,
    CreateTextThreadWithMessageRequest createTextThreadWithMessageRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/messages/{message_id}/threads'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      body: createTextThreadWithMessageRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ThreadResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> setChannelPermissionOverwrite(
    SnowflakeType channelId,
    SnowflakeType overwriteId,
    SetChannelPermissionOverwriteRequest setChannelPermissionOverwriteRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/channels/{channel_id}/permissions/{overwrite_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll(
            '{overwrite_id}',
            Uri.encodeComponent(overwriteId.toJson()),
          ),
      body: setChannelPermissionOverwriteRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> deleteChannelPermissionOverwrite(
    SnowflakeType channelId,
    SnowflakeType overwriteId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/channels/{channel_id}/permissions/{overwrite_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll(
            '{overwrite_id}',
            Uri.encodeComponent(overwriteId.toJson()),
          ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<List<MessageResponse>> deprecatedListPins(
    SnowflakeType channelId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/pins'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<MessageResponse>(
            (e) => MessageResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deprecatedCreatePin(
    SnowflakeType channelId,
    SnowflakeType messageId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/channels/{channel_id}/pins/{message_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> deprecatedDeletePin(
    SnowflakeType channelId,
    SnowflakeType messageId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/channels/{channel_id}/pins/{message_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<PollAnswerDetailsResponse> getAnswerVoters(
    SnowflakeType channelId,
    SnowflakeType messageId,
    int answerId, {
    SnowflakeType? after,
    int? limit,
  }) async {
    answerId.validate(min: 1, max: 10);
    limit?.validate(min: 1, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/polls/{message_id}/answers/{answer_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson()))
          .replaceAll('{answer_id}', '$answerId'),
      queryParameters: {
        if (after != null) 'after': [after.toJson()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return PollAnswerDetailsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<MessageResponse> pollExpire(
    SnowflakeType channelId,
    SnowflakeType messageId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/polls/{message_id}/expire'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return MessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<AddGroupDmUserResponse> addGroupDmUser(
    SnowflakeType channelId,
    SnowflakeType userId,
    AddGroupDmUserRequest addGroupDmUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/channels/{channel_id}/recipients/{user_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      body: addGroupDmUserRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      201 => AddGroupDmUserResponse201(
        AddGroupDmUser201Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const AddGroupDmUserResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<void> deleteGroupDmUser(
    SnowflakeType channelId,
    SnowflakeType userId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/channels/{channel_id}/recipients/{user_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> sendSoundboardSound(
    SnowflakeType channelId,
    SoundboardSoundSendRequest soundboardSoundSendRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/send-soundboard-sound'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: soundboardSoundSendRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<List<ThreadMemberResponse>> listThreadMembers(
    SnowflakeType channelId, {
    bool? withMember,
    int? limit,
    SnowflakeType? after,
  }) async {
    limit?.validate(min: 1, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/thread-members'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      queryParameters: {
        if (withMember != null) 'with_member': [withMember.toString()],
        if (limit != null) 'limit': [limit.toString()],
        if (after != null) 'after': [after.toJson()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ThreadMemberResponse>(
            (e) => ThreadMemberResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> joinThread(SnowflakeType channelId) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/channels/{channel_id}/thread-members/@me'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> leaveThread(SnowflakeType channelId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/channels/{channel_id}/thread-members/@me'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<ThreadMemberResponse> getThreadMember(
    SnowflakeType channelId,
    SnowflakeType userId, {
    bool? withMember,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/thread-members/{user_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      queryParameters: {
        if (withMember != null) 'with_member': [withMember.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ThreadMemberResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> addThreadMember(
    SnowflakeType channelId,
    SnowflakeType userId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/channels/{channel_id}/thread-members/{user_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> deleteThreadMember(
    SnowflakeType channelId,
    SnowflakeType userId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/channels/{channel_id}/thread-members/{user_id}'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<CreatedThreadResponse> createThread(
    SnowflakeType channelId,
    CreateThreadRequest createThreadRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/threads'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: createThreadRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return CreatedThreadResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ThreadsResponse> listPrivateArchivedThreads(
    SnowflakeType channelId, {
    DateTime? before,
    int? limit,
  }) async {
    limit?.validate(min: 2, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/threads/archived/private'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      queryParameters: {
        if (before != null) 'before': [before.toIso8601String()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ThreadsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ThreadsResponse> listPublicArchivedThreads(
    SnowflakeType channelId, {
    DateTime? before,
    int? limit,
  }) async {
    limit?.validate(min: 2, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/threads/archived/public'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      queryParameters: {
        if (before != null) 'before': [before.toIso8601String()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ThreadsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ThreadSearchResponse2> threadSearch(
    SnowflakeType channelId, {
    String? name,
    int? slop,
    SnowflakeType? minId,
    SnowflakeType? maxId,
    ThreadSearchParameter4? tag,
    ThreadSearchTagSetting? tagSetting,
    bool? archived,
    ThreadSortingMode? sortBy,
    SortingOrder? sortOrder,
    int? limit,
    int? offset,
  }) async {
    name?.validate(maxLength: 100);
    slop?.validate(min: 0, max: 100);
    limit?.validate(min: 1, max: 25);
    offset?.validate(min: 0, max: 9975);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/threads/search'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      queryParameters: {
        if (name != null) 'name': [name],
        if (slop != null) 'slop': [slop.toString()],
        if (minId != null) 'min_id': [minId.toJson()],
        if (maxId != null) 'max_id': [maxId.toJson()],
        if (tag != null)
          'tag': switch (tag) {
            ThreadSearchParameter4String(:final value) => [value],
            ThreadSearchParameter4List(:final value) =>
              value.map((e) => e.toJson()).toList(),
          },
        if (tagSetting != null) 'tag_setting': [tagSetting.toJson()],
        if (archived != null) 'archived': [archived.toString()],
        if (sortBy != null) 'sort_by': [sortBy.toJson()],
        if (sortOrder != null) 'sort_order': [sortOrder.toJson()],
        if (limit != null) 'limit': [limit.toString()],
        if (offset != null) 'offset': [offset.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      200 => ThreadSearchResponse2200(
        ThreadSearchResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      202 => ThreadSearchResponse2202(
        SearchIndexNotReadyResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<TriggerTypingIndicatorResponse> triggerTypingIndicator(
    SnowflakeType channelId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/typing'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      200 => TriggerTypingIndicatorResponse200(
        TypingIndicatorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const TriggerTypingIndicatorResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<ThreadsResponse> listMyPrivateArchivedThreads(
    SnowflakeType channelId, {
    SnowflakeType? before,
    int? limit,
  }) async {
    limit?.validate(min: 2, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/users/@me/threads/archived/private'
          .replaceAll('{channel_id}', Uri.encodeComponent(channelId.toJson())),
      queryParameters: {
        if (before != null) 'before': [before.toJson()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ThreadsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set a voice channel's status.
  Future<void> updateVoiceChannelStatus(
    SnowflakeType channelId,
    UpdateVoiceChannelStatusRequest updateVoiceChannelStatusRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/channels/{channel_id}/voice-status'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: updateVoiceChannelStatusRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<List<ListChannelWebhooks200ResponseInner>> listChannelWebhooks(
    SnowflakeType channelId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/channels/{channel_id}/webhooks'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ListChannelWebhooks200ResponseInner>(
            (e) => ListChannelWebhooks200ResponseInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildIncomingWebhookResponse> createWebhook(
    SnowflakeType channelId,
    CreateWebhookRequest createWebhookRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/channels/{channel_id}/webhooks'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: createWebhookRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildIncomingWebhookResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GatewayResponse> getGateway() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gateway',
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GatewayResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GatewayBotResponse> getBotGateway() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gateway/bot',
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GatewayBotResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildTemplateResponse> getGuildTemplate(String code) async {
    code.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/templates/{code}'.replaceAll(
        '{code}',
        Uri.encodeComponent(code),
      ),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildTemplateResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildWithCountsResponse> getGuild(
    SnowflakeType guildId, {
    bool? withCounts,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      queryParameters: {
        if (withCounts != null) 'with_counts': [withCounts.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildWithCountsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildResponse> updateGuild(
    SnowflakeType guildId,
    GuildPatchRequestPartial guildPatchRequestPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: guildPatchRequestPartial.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildAuditLogResponse> listGuildAuditLogEntries(
    SnowflakeType guildId, {
    SnowflakeType? userId,
    SnowflakeType? targetId,
    AuditLogActionTypes? actionType,
    SnowflakeType? before,
    SnowflakeType? after,
    int? limit,
  }) async {
    limit?.validate(min: 1, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/audit-logs'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      queryParameters: {
        if (userId != null) 'user_id': [userId.toJson()],
        if (targetId != null) 'target_id': [targetId.toJson()],
        if (actionType != null) 'action_type': [actionType.toJson().toString()],
        if (before != null) 'before': [before.toJson()],
        if (after != null) 'after': [after.toJson()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildAuditLogResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ListAutoModerationRules200ResponseInner>> listAutoModerationRules(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/auto-moderation/rules'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ListAutoModerationRules200ResponseInner>(
            (e) => ListAutoModerationRules200ResponseInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ListAutoModerationRules200ResponseInner> createAutoModerationRule(
    SnowflakeType guildId,
    CreateAutoModerationRuleRequest createAutoModerationRuleRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/guilds/{guild_id}/auto-moderation/rules'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: createAutoModerationRuleRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListAutoModerationRules200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ListAutoModerationRules200ResponseInner> getAutoModerationRule(
    SnowflakeType guildId,
    SnowflakeType ruleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/auto-moderation/rules/{rule_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{rule_id}', Uri.encodeComponent(ruleId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListAutoModerationRules200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteAutoModerationRule(
    SnowflakeType guildId,
    SnowflakeType ruleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/auto-moderation/rules/{rule_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{rule_id}', Uri.encodeComponent(ruleId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<ListAutoModerationRules200ResponseInner> updateAutoModerationRule(
    SnowflakeType guildId,
    SnowflakeType ruleId,
    UpdateAutoModerationRuleRequest updateAutoModerationRuleRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/auto-moderation/rules/{rule_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{rule_id}', Uri.encodeComponent(ruleId.toJson())),
      body: updateAutoModerationRuleRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListAutoModerationRules200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<GuildBanResponse>> listGuildBans(
    SnowflakeType guildId, {
    int? limit,
    SnowflakeType? before,
    SnowflakeType? after,
  }) async {
    limit?.validate(min: 1, max: 1000);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/bans'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      queryParameters: {
        if (limit != null) 'limit': [limit.toString()],
        if (before != null) 'before': [before.toJson()],
        if (after != null) 'after': [after.toJson()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GuildBanResponse>(
            (e) => GuildBanResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildBanResponse> getGuildBan(
    SnowflakeType guildId,
    SnowflakeType userId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/bans/{user_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildBanResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> banUserFromGuild(
    SnowflakeType guildId,
    SnowflakeType userId,
    BanUserFromGuildRequest banUserFromGuildRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/guilds/{guild_id}/bans/{user_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      body: banUserFromGuildRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> unbanUserFromGuild(
    SnowflakeType guildId,
    SnowflakeType userId,
    UnbanUserFromGuildRequest unbanUserFromGuildRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/bans/{user_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      body: unbanUserFromGuildRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<BulkBanUsersFromGuildResponse> bulkBanUsersFromGuild(
    SnowflakeType guildId,
    BulkBanUsersRequest bulkBanUsersRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/guilds/{guild_id}/bulk-ban'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: bulkBanUsersRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      200 => BulkBanUsersFromGuildResponse200(
        BulkBanUsersResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const BulkBanUsersFromGuildResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<List<GetChannel200Response>> listGuildChannels(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/channels'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GetChannel200Response>(
            (e) => GetChannel200Response.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildChannelResponse> createGuildChannel(
    SnowflakeType guildId,
    CreateGuildChannelRequest createGuildChannelRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/guilds/{guild_id}/channels'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: createGuildChannelRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildChannelResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> bulkUpdateGuildChannels(
    SnowflakeType guildId,
    List<BulkUpdateGuildChannelsRequestInner> list,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/channels'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: list.map((e) => e.toJson()).toList(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<List<EmojiResponse>> listGuildEmojis(SnowflakeType guildId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/emojis'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<EmojiResponse>(
            (e) => EmojiResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<EmojiResponse> createGuildEmoji(
    SnowflakeType guildId,
    CreateGuildEmojiRequest createGuildEmojiRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/guilds/{guild_id}/emojis'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: createGuildEmojiRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return EmojiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<EmojiResponse> getGuildEmoji(
    SnowflakeType guildId,
    SnowflakeType emojiId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/emojis/{emoji_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{emoji_id}', Uri.encodeComponent(emojiId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return EmojiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteGuildEmoji(
    SnowflakeType guildId,
    SnowflakeType emojiId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/emojis/{emoji_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{emoji_id}', Uri.encodeComponent(emojiId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<EmojiResponse> updateGuildEmoji(
    SnowflakeType guildId,
    SnowflakeType emojiId,
    UpdateGuildEmojiRequest updateGuildEmojiRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/emojis/{emoji_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{emoji_id}', Uri.encodeComponent(emojiId.toJson())),
      body: updateGuildEmojiRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return EmojiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ListGuildIntegrations200ResponseInner>> listGuildIntegrations(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/integrations'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ListGuildIntegrations200ResponseInner>(
            (e) => ListGuildIntegrations200ResponseInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteGuildIntegration(
    SnowflakeType guildId,
    SnowflakeType integrationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/integrations/{integration_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll(
            '{integration_id}',
            Uri.encodeComponent(integrationId.toJson()),
          ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<List<ListChannelInvites200ResponseInner>> listGuildInvites(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/invites'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ListChannelInvites200ResponseInner>(
            (e) => ListChannelInvites200ResponseInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<GuildMemberResponse>> listGuildMembers(
    SnowflakeType guildId, {
    int? limit,
    int? after,
  }) async {
    limit?.validate(min: 1, max: 1000);
    after?.validate(min: 0);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/members'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      queryParameters: {
        if (limit != null) 'limit': [limit.toString()],
        if (after != null) 'after': [after.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GuildMemberResponse>(
            (e) => GuildMemberResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<PrivateGuildMemberResponse> updateMyGuildMember(
    SnowflakeType guildId,
    UpdateMyGuildMemberRequest updateMyGuildMemberRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/members/@me'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: updateMyGuildMemberRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return PrivateGuildMemberResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<GuildMemberResponse>> searchGuildMembers(
    SnowflakeType guildId,
    String query, {
    int? limit,
  }) async {
    limit?.validate(min: 1, max: 1000);
    query.validate(minLength: 1, maxLength: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/members/search'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      queryParameters: {
        if (limit != null) 'limit': [limit.toString()],
        'query': [query],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GuildMemberResponse>(
            (e) => GuildMemberResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildMemberResponse> getGuildMember(
    SnowflakeType guildId,
    SnowflakeType userId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/members/{user_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildMemberResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<AddGuildMemberResponse> addGuildMember(
    SnowflakeType guildId,
    SnowflakeType userId,
    BotAddGuildMemberRequest botAddGuildMemberRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/guilds/{guild_id}/members/{user_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      body: botAddGuildMemberRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      201 => AddGuildMemberResponse201(
        GuildMemberResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const AddGuildMemberResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<void> deleteGuildMember(
    SnowflakeType guildId,
    SnowflakeType userId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/members/{user_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<UpdateGuildMemberResponse> updateGuildMember(
    SnowflakeType guildId,
    SnowflakeType userId,
    UpdateGuildMemberRequest updateGuildMemberRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/members/{user_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      body: updateGuildMemberRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      200 => UpdateGuildMemberResponse200(
        GuildMemberResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const UpdateGuildMemberResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<void> addGuildMemberRole(
    SnowflakeType guildId,
    SnowflakeType userId,
    SnowflakeType roleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/guilds/{guild_id}/members/{user_id}/roles/{role_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson()))
          .replaceAll('{role_id}', Uri.encodeComponent(roleId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> deleteGuildMemberRole(
    SnowflakeType guildId,
    SnowflakeType userId,
    SnowflakeType roleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/members/{user_id}/roles/{role_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson()))
          .replaceAll('{role_id}', Uri.encodeComponent(roleId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<GuildSearchResponse2> guildSearch(
    SnowflakeType guildId, {
    SortingMode? sortBy,
    SortingOrder? sortOrder,
    String? content,
    int? slop,
    List<SnowflakeType>? authorId,
    List<AuthorType>? authorType,
    List<SnowflakeType>? mentions,
    List<SnowflakeType>? mentionsRoleId,
    List<SnowflakeType>? repliedToUserId,
    List<SnowflakeType>? repliedToMessageId,
    bool? mentionEveryone,
    SnowflakeType? minId,
    SnowflakeType? maxId,
    int? limit,
    int? offset,
    List<HasOption>? has,
    List<String>? linkHostname,
    List<String>? embedProvider,
    List<SearchableEmbedType>? embedType,
    List<String>? attachmentExtension,
    List<String>? attachmentFilename,
    bool? pinned,
    bool? includeNsfw,
    List<SnowflakeType>? channelId,
  }) async {
    content?.validate(maxLength: 1024);
    slop?.validate(min: 0, max: 100);
    authorId?.validate(maxItems: 100, unique: true);
    authorType?.validate(maxItems: 6, unique: true);
    mentions?.validate(maxItems: 100, unique: true);
    mentionsRoleId?.validate(maxItems: 100, unique: true);
    repliedToUserId?.validate(maxItems: 100, unique: true);
    repliedToMessageId?.validate(maxItems: 100, unique: true);
    limit?.validate(min: 1, max: 25);
    offset?.validate(min: 0, max: 9975);
    has?.validate(maxItems: 18, unique: true);
    linkHostname?.validate(maxItems: 100, unique: true);
    embedProvider?.validate(maxItems: 100, unique: true);
    embedType?.validate(maxItems: 5, unique: true);
    attachmentExtension?.validate(maxItems: 100, unique: true);
    attachmentFilename?.validate(maxItems: 100, unique: true);
    channelId?.validate(maxItems: 500, unique: true);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/messages/search'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      queryParameters: {
        if (sortBy != null) 'sort_by': [sortBy.toJson()],
        if (sortOrder != null) 'sort_order': [sortOrder.toJson()],
        if (content != null) 'content': [content],
        if (slop != null) 'slop': [slop.toString()],
        if (authorId != null)
          'author_id': authorId.map((e) => e.toJson()).toList(),
        if (authorType != null)
          'author_type': authorType.map((e) => e.toJson()).toList(),
        if (mentions != null)
          'mentions': mentions.map((e) => e.toJson()).toList(),
        if (mentionsRoleId != null)
          'mentions_role_id': mentionsRoleId.map((e) => e.toJson()).toList(),
        if (repliedToUserId != null)
          'replied_to_user_id': repliedToUserId.map((e) => e.toJson()).toList(),
        if (repliedToMessageId != null)
          'replied_to_message_id': repliedToMessageId
              .map((e) => e.toJson())
              .toList(),
        if (mentionEveryone != null)
          'mention_everyone': [mentionEveryone.toString()],
        if (minId != null) 'min_id': [minId.toJson()],
        if (maxId != null) 'max_id': [maxId.toJson()],
        if (limit != null) 'limit': [limit.toString()],
        if (offset != null) 'offset': [offset.toString()],
        if (has != null) 'has': has.map((e) => e.toJson()).toList(),
        if (linkHostname != null) 'link_hostname': linkHostname,
        if (embedProvider != null) 'embed_provider': embedProvider,
        if (embedType != null)
          'embed_type': embedType.map((e) => e.toJson()).toList(),
        if (attachmentExtension != null)
          'attachment_extension': attachmentExtension,
        if (attachmentFilename != null)
          'attachment_filename': attachmentFilename,
        if (pinned != null) 'pinned': [pinned.toString()],
        if (includeNsfw != null) 'include_nsfw': [includeNsfw.toString()],
        if (channelId != null)
          'channel_id': channelId.map((e) => e.toJson()).toList(),
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      200 => GuildSearchResponse2200(
        GuildSearchResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      202 => GuildSearchResponse2202(
        SearchIndexNotReadyResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<GetGuildNewMemberWelcomeResponse> getGuildNewMemberWelcome(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/new-member-welcome'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      200 => GetGuildNewMemberWelcomeResponse200(
        GuildHomeSettingsResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const GetGuildNewMemberWelcomeResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<UserGuildOnboardingResponse> getGuildsOnboarding(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/onboarding'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return UserGuildOnboardingResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildOnboardingResponse> putGuildsOnboarding(
    SnowflakeType guildId,
    UpdateGuildOnboardingRequest updateGuildOnboardingRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/guilds/{guild_id}/onboarding'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: updateGuildOnboardingRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildOnboardingResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildPreviewResponse> getGuildPreview(SnowflakeType guildId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/preview'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildPreviewResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildPruneResponse> previewPruneGuild(
    SnowflakeType guildId, {
    int? days,
    PreviewPruneGuildParameter1? includeRoles,
  }) async {
    days?.validate(min: 1, max: 30);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/prune'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      queryParameters: {
        if (days != null) 'days': [days.toString()],
        if (includeRoles != null)
          'include_roles': switch (includeRoles) {
            PreviewPruneGuildParameter1String(:final value) => [value],
            PreviewPruneGuildParameter1List(:final value) =>
              value.map((e) => e.toJson()).toList(),
          },
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildPruneResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildPruneResponse> pruneGuild(
    SnowflakeType guildId,
    PruneGuildRequest pruneGuildRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/guilds/{guild_id}/prune'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: pruneGuildRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildPruneResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<VoiceRegionResponse>> listGuildVoiceRegions(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/regions'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<VoiceRegionResponse>(
            (e) => VoiceRegionResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<GuildRoleResponse>> listGuildRoles(SnowflakeType guildId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/roles'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GuildRoleResponse>(
            (e) => GuildRoleResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildRoleResponse> createGuildRole(
    SnowflakeType guildId,
    CreateRoleRequest createRoleRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/guilds/{guild_id}/roles'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: createRoleRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildRoleResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<GuildRoleResponse>> bulkUpdateGuildRoles(
    SnowflakeType guildId,
    List<UpdateRolePositionsRequest> list,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/roles'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: list.map((e) => e.toJson()).toList(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GuildRoleResponse>(
            (e) => GuildRoleResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<Map<String, int>> guildRoleMemberCounts(SnowflakeType guildId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/roles/member-counts'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, value as int),
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildRoleResponse> getGuildRole(
    SnowflakeType guildId,
    SnowflakeType roleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/roles/{role_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{role_id}', Uri.encodeComponent(roleId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildRoleResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteGuildRole(
    SnowflakeType guildId,
    SnowflakeType roleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/roles/{role_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{role_id}', Uri.encodeComponent(roleId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<GuildRoleResponse> updateGuildRole(
    SnowflakeType guildId,
    SnowflakeType roleId,
    UpdateRoleRequestPartial updateRoleRequestPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/roles/{role_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{role_id}', Uri.encodeComponent(roleId.toJson())),
      body: updateRoleRequestPartial.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildRoleResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ListGuildScheduledEvents200ResponseInner>>
  listGuildScheduledEvents(SnowflakeType guildId, {bool? withUserCount}) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/scheduled-events'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      queryParameters: {
        if (withUserCount != null)
          'with_user_count': [withUserCount.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ListGuildScheduledEvents200ResponseInner>(
            (e) => ListGuildScheduledEvents200ResponseInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ListGuildScheduledEvents200ResponseInner> createGuildScheduledEvent(
    SnowflakeType guildId,
    CreateGuildScheduledEventRequest createGuildScheduledEventRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/guilds/{guild_id}/scheduled-events'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: createGuildScheduledEventRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListGuildScheduledEvents200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ListGuildScheduledEvents200ResponseInner> getGuildScheduledEvent(
    SnowflakeType guildId,
    SnowflakeType guildScheduledEventId, {
    bool? withUserCount,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll(
            '{guild_scheduled_event_id}',
            Uri.encodeComponent(guildScheduledEventId.toJson()),
          ),
      queryParameters: {
        if (withUserCount != null)
          'with_user_count': [withUserCount.toString()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListGuildScheduledEvents200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteGuildScheduledEvent(
    SnowflakeType guildId,
    SnowflakeType guildScheduledEventId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll(
            '{guild_scheduled_event_id}',
            Uri.encodeComponent(guildScheduledEventId.toJson()),
          ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<ListGuildScheduledEvents200ResponseInner> updateGuildScheduledEvent(
    SnowflakeType guildId,
    SnowflakeType guildScheduledEventId,
    UpdateGuildScheduledEventRequest updateGuildScheduledEventRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll(
            '{guild_scheduled_event_id}',
            Uri.encodeComponent(guildScheduledEventId.toJson()),
          ),
      body: updateGuildScheduledEventRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListGuildScheduledEvents200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ScheduledEventUserResponse>> listGuildScheduledEventUsers(
    SnowflakeType guildId,
    SnowflakeType guildScheduledEventId, {
    bool? withMember,
    int? limit,
    SnowflakeType? before,
    SnowflakeType? after,
  }) async {
    limit?.validate(min: 1, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}/users'
              .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
              .replaceAll(
                '{guild_scheduled_event_id}',
                Uri.encodeComponent(guildScheduledEventId.toJson()),
              ),
      queryParameters: {
        if (withMember != null) 'with_member': [withMember.toString()],
        if (limit != null) 'limit': [limit.toString()],
        if (before != null) 'before': [before.toJson()],
        if (after != null) 'after': [after.toJson()],
      },
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ScheduledEventUserResponse>(
            (e) =>
                ScheduledEventUserResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ListGuildSoundboardSoundsResponse> listGuildSoundboardSounds(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/soundboard-sounds'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListGuildSoundboardSoundsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<SoundboardSoundResponse> createGuildSoundboardSound(
    SnowflakeType guildId,
    SoundboardCreateRequest soundboardCreateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/guilds/{guild_id}/soundboard-sounds'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: soundboardCreateRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return SoundboardSoundResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<SoundboardSoundResponse> getGuildSoundboardSound(
    SnowflakeType guildId,
    SnowflakeType soundId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/soundboard-sounds/{sound_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{sound_id}', Uri.encodeComponent(soundId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return SoundboardSoundResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteGuildSoundboardSound(
    SnowflakeType guildId,
    SnowflakeType soundId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/soundboard-sounds/{sound_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{sound_id}', Uri.encodeComponent(soundId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<SoundboardSoundResponse> updateGuildSoundboardSound(
    SnowflakeType guildId,
    SnowflakeType soundId,
    SoundboardPatchRequestPartial soundboardPatchRequestPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/soundboard-sounds/{sound_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{sound_id}', Uri.encodeComponent(soundId.toJson())),
      body: soundboardPatchRequestPartial.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return SoundboardSoundResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<GuildStickerResponse>> listGuildStickers(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/stickers'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GuildStickerResponse>(
            (e) => GuildStickerResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildStickerResponse> createGuildSticker(
    SnowflakeType guildId,
    CreateGuildStickerRequest createGuildStickerRequest,
  ) async {
    final multipartFields = <String, String>{
      'name': createGuildStickerRequest.name,
      'tags': createGuildStickerRequest.tags,
    };
    final multipartFiles = <http.MultipartFile>[
      http.MultipartFile.fromBytes(
        'file',
        createGuildStickerRequest.file,
        filename: 'file',
      ),
    ];
    {
      final v = createGuildStickerRequest.description;
      if (v != null) multipartFields['description'] = v;
    }
    final response = await client.invokeApiMultipart(
      method: Method.post,
      path: '/guilds/{guild_id}/stickers'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      fields: multipartFields,
      files: multipartFiles,
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildStickerResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildStickerResponse> getGuildSticker(
    SnowflakeType guildId,
    SnowflakeType stickerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/stickers/{sticker_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{sticker_id}', Uri.encodeComponent(stickerId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildStickerResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteGuildSticker(
    SnowflakeType guildId,
    SnowflakeType stickerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/stickers/{sticker_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{sticker_id}', Uri.encodeComponent(stickerId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<GuildStickerResponse> updateGuildSticker(
    SnowflakeType guildId,
    SnowflakeType stickerId,
    UpdateGuildStickerRequest updateGuildStickerRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/stickers/{sticker_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{sticker_id}', Uri.encodeComponent(stickerId.toJson())),
      body: updateGuildStickerRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildStickerResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<GuildTemplateResponse>> listGuildTemplates(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/templates'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GuildTemplateResponse>(
            (e) => GuildTemplateResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildTemplateResponse> createGuildTemplate(
    SnowflakeType guildId,
    CreateGuildTemplateRequest createGuildTemplateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/guilds/{guild_id}/templates'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: createGuildTemplateRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildTemplateResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildTemplateResponse> syncGuildTemplate(
    SnowflakeType guildId,
    String code,
  ) async {
    code.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.put,
      path: '/guilds/{guild_id}/templates/{code}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{code}', Uri.encodeComponent(code)),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildTemplateResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildTemplateResponse> deleteGuildTemplate(
    SnowflakeType guildId,
    String code,
  ) async {
    code.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.delete,
      path: '/guilds/{guild_id}/templates/{code}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{code}', Uri.encodeComponent(code)),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildTemplateResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildTemplateResponse> updateGuildTemplate(
    SnowflakeType guildId,
    String code,
    UpdateGuildTemplateRequest updateGuildTemplateRequest,
  ) async {
    code.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/templates/{code}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{code}', Uri.encodeComponent(code)),
      body: updateGuildTemplateRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildTemplateResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ThreadsResponse> getActiveGuildThreads(SnowflakeType guildId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/threads/active'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ThreadsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<VanityUrlResponse> getGuildVanityUrl(SnowflakeType guildId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/vanity-url'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return VanityUrlResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<VoiceStateResponse> getSelfVoiceState(SnowflakeType guildId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/voice-states/@me'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return VoiceStateResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> updateSelfVoiceState(
    SnowflakeType guildId,
    UpdateSelfVoiceStateRequestPartial updateSelfVoiceStateRequestPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/voice-states/@me'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: updateSelfVoiceStateRequestPartial.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<VoiceStateResponse> getVoiceState(
    SnowflakeType guildId,
    SnowflakeType userId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/voice-states/{user_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return VoiceStateResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> updateVoiceState(
    SnowflakeType guildId,
    SnowflakeType userId,
    UpdateVoiceStateRequestPartial updateVoiceStateRequestPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/voice-states/{user_id}'
          .replaceAll('{guild_id}', Uri.encodeComponent(guildId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      body: updateVoiceStateRequestPartial.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<List<ListChannelWebhooks200ResponseInner>> getGuildWebhooks(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/webhooks'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ListChannelWebhooks200ResponseInner>(
            (e) => ListChannelWebhooks200ResponseInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildWelcomeScreenResponse> getGuildWelcomeScreen(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/welcome-screen'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildWelcomeScreenResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GuildWelcomeScreenResponse> updateGuildWelcomeScreen(
    SnowflakeType guildId,
    WelcomeScreenPatchRequestPartial welcomeScreenPatchRequestPartial,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/welcome-screen'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: welcomeScreenPatchRequestPartial.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GuildWelcomeScreenResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<WidgetSettingsResponse> getGuildWidgetSettings(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/widget'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return WidgetSettingsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<WidgetSettingsResponse> updateGuildWidgetSettings(
    SnowflakeType guildId,
    UpdateGuildWidgetSettingsRequest updateGuildWidgetSettingsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/guilds/{guild_id}/widget'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      body: updateGuildWidgetSettingsRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return WidgetSettingsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<WidgetResponse> getGuildWidget(SnowflakeType guildId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/widget.json'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return WidgetResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<Uint8List> getGuildWidgetPng(
    SnowflakeType guildId, {
    WidgetImageStyles? style,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/guilds/{guild_id}/widget.png'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      queryParameters: {
        if (style != null) 'style': [style.toJson()],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return response.bodyBytes;
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<CreateInteractionResponseResponse> createInteractionResponse(
    SnowflakeType interactionId,
    String interactionToken,
    CreateInteractionResponseRequest createInteractionResponseRequest, {
    bool? withResponse,
  }) async {
    interactionToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.post,
      path: '/interactions/{interaction_id}/{interaction_token}/callback'
          .replaceAll(
            '{interaction_id}',
            Uri.encodeComponent(interactionId.toJson()),
          )
          .replaceAll(
            '{interaction_token}',
            Uri.encodeComponent(interactionToken),
          ),
      queryParameters: {
        if (withResponse != null) 'with_response': [withResponse.toString()],
      },
      body: createInteractionResponseRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      200 => CreateInteractionResponseResponse200(
        InteractionCallbackResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const CreateInteractionResponseResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<ListChannelInvites200ResponseInner> inviteResolve(
    String code, {
    bool? withCounts,
    SnowflakeType? guildScheduledEventId,
  }) async {
    code.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/invites/{code}'.replaceAll('{code}', Uri.encodeComponent(code)),
      queryParameters: {
        if (withCounts != null) 'with_counts': [withCounts.toString()],
        if (guildScheduledEventId != null)
          'guild_scheduled_event_id': [guildScheduledEventId.toJson()],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListChannelInvites200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ListChannelInvites200ResponseInner> inviteRevoke(String code) async {
    code.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.delete,
      path: '/invites/{code}'.replaceAll('{code}', Uri.encodeComponent(code)),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListChannelInvites200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the target users for an invite.
  Future<Uint8List> getInviteTargetUsers(String code) async {
    code.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/invites/{code}/target-users'.replaceAll(
        '{code}',
        Uri.encodeComponent(code),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return response.bodyBytes;
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update the target users for an existing invite.
  Future<void> updateInviteTargetUsers(
    String code,
    UpdateInviteTargetUsersRequest updateInviteTargetUsersRequest,
  ) async {
    code.validate(maxLength: 152133);

    final multipartFields = <String, String>{};
    final multipartFiles = <http.MultipartFile>[
      http.MultipartFile.fromBytes(
        'target_users_file',
        updateInviteTargetUsersRequest.targetUsersFile,
        filename: 'target_users_file',
      ),
    ];
    final response = await client.invokeApiMultipart(
      method: Method.put,
      path: '/invites/{code}/target-users'.replaceAll(
        '{code}',
        Uri.encodeComponent(code),
      ),
      fields: multipartFields,
      files: multipartFiles,
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  /// Get the target users job status for an invite.
  Future<TargetUsersJobStatusResponse> getInviteTargetUsersJobStatus(
    String code,
  ) async {
    code.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/invites/{code}/target-users/job-status'.replaceAll(
        '{code}',
        Uri.encodeComponent(code),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return TargetUsersJobStatusResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<LobbyResponse> createLobby(
    CreateLobbyRequest createLobbyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/lobbies',
      body: createLobbyRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return LobbyResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<LobbyResponse> createOrJoinLobby(
    CreateOrJoinLobbyRequest createOrJoinLobbyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/lobbies',
      body: createOrJoinLobbyRequest.toJson(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return LobbyResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<LobbyResponse> getLobby(SnowflakeType lobbyId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/lobbies/{lobby_id}'.replaceAll(
        '{lobby_id}',
        Uri.encodeComponent(lobbyId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return LobbyResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<LobbyResponse> editLobby(
    SnowflakeType lobbyId,
    EditLobbyRequest editLobbyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/lobbies/{lobby_id}'.replaceAll(
        '{lobby_id}',
        Uri.encodeComponent(lobbyId.toJson()),
      ),
      body: editLobbyRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return LobbyResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<LobbyResponse> editLobbyChannelLink(
    SnowflakeType lobbyId,
    EditLobbyChannelLinkRequest editLobbyChannelLinkRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/lobbies/{lobby_id}/channel-linking'.replaceAll(
        '{lobby_id}',
        Uri.encodeComponent(lobbyId.toJson()),
      ),
      body: editLobbyChannelLinkRequest.toJson(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return LobbyResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> leaveLobby(SnowflakeType lobbyId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/lobbies/{lobby_id}/members/@me'.replaceAll(
        '{lobby_id}',
        Uri.encodeComponent(lobbyId.toJson()),
      ),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<LobbyGuildInviteResponse> createLinkedLobbyGuildInviteForSelf(
    SnowflakeType lobbyId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/lobbies/{lobby_id}/members/@me/invites'.replaceAll(
        '{lobby_id}',
        Uri.encodeComponent(lobbyId.toJson()),
      ),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return LobbyGuildInviteResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<LobbyMemberResponse>> bulkUpdateLobbyMembers(
    SnowflakeType lobbyId,
    List<BulkLobbyMemberRequest> list,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/lobbies/{lobby_id}/members/bulk'.replaceAll(
        '{lobby_id}',
        Uri.encodeComponent(lobbyId.toJson()),
      ),
      body: list.map((e) => e.toJson()).toList(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<LobbyMemberResponse>(
            (e) => LobbyMemberResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<LobbyMemberResponse> addLobbyMember(
    SnowflakeType lobbyId,
    SnowflakeType userId,
    AddLobbyMemberRequest addLobbyMemberRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/lobbies/{lobby_id}/members/{user_id}'
          .replaceAll('{lobby_id}', Uri.encodeComponent(lobbyId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      body: addLobbyMemberRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return LobbyMemberResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteLobbyMember(
    SnowflakeType lobbyId,
    SnowflakeType userId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/lobbies/{lobby_id}/members/{user_id}'
          .replaceAll('{lobby_id}', Uri.encodeComponent(lobbyId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<LobbyGuildInviteResponse> createLinkedLobbyGuildInviteForUser(
    SnowflakeType lobbyId,
    SnowflakeType userId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/lobbies/{lobby_id}/members/{user_id}/invites'
          .replaceAll('{lobby_id}', Uri.encodeComponent(lobbyId.toJson()))
          .replaceAll('{user_id}', Uri.encodeComponent(userId.toJson())),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return LobbyGuildInviteResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<LobbyMessageResponse>> getLobbyMessages(
    SnowflakeType lobbyId, {
    int? limit,
  }) async {
    limit?.validate(min: 1, max: 200);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/lobbies/{lobby_id}/messages'.replaceAll(
        '{lobby_id}',
        Uri.encodeComponent(lobbyId.toJson()),
      ),
      queryParameters: {
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<LobbyMessageResponse>(
            (e) => LobbyMessageResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<LobbyMessageResponse> createLobbyMessage(
    SnowflakeType lobbyId,
    SdkMessageRequest sdkMessageRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/lobbies/{lobby_id}/messages'.replaceAll(
        '{lobby_id}',
        Uri.encodeComponent(lobbyId.toJson()),
      ),
      body: sdkMessageRequest.toJson(),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return LobbyMessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update the external moderation metadata for a lobby message.
  Future<void> updateLobbyMessageExternalModerationMetadata(
    SnowflakeType lobbyId,
    SnowflakeType messageId,
    Map<String, String> map,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/lobbies/{lobby_id}/messages/{message_id}/moderation-metadata'
          .replaceAll('{lobby_id}', Uri.encodeComponent(lobbyId.toJson()))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      body: map,
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<OAuth2GetAuthorizationResponse> getMyOauth2Authorization() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/oauth2/@me',
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return OAuth2GetAuthorizationResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<PrivateApplicationResponse> getMyOauth2Application() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/oauth2/applications/@me',
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return PrivateApplicationResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<OAuth2GetKeys> getPublicKeys() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/oauth2/keys',
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return OAuth2GetKeys.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<OAuth2GetOpenIdConnectUserInfoResponse>
  getOpenidConnectUserinfo() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/oauth2/userinfo',
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return OAuth2GetOpenIdConnectUserInfoResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update the external moderation metadata for a user message (DM).
  Future<void> updateUserMessageExternalModerationMetadata(
    SnowflakeType userId1,
    SnowflakeType userId2,
    SnowflakeType messageId,
    Map<String, String> map,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/partner-sdk/dms/{user_id_1}/{user_id_2}/messages/{message_id}/moderation-metadata'
              .replaceAll('{user_id_1}', Uri.encodeComponent(userId1.toJson()))
              .replaceAll('{user_id_2}', Uri.encodeComponent(userId2.toJson()))
              .replaceAll(
                '{message_id}',
                Uri.encodeComponent(messageId.toJson()),
              ),
      body: map,
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> partnerSdkUnmergeProvisionalAccount(
    PartnerSdkUnmergeProvisionalAccountRequest
    partnerSdkUnmergeProvisionalAccountRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/partner-sdk/provisional-accounts/unmerge',
      body: partnerSdkUnmergeProvisionalAccountRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<void> botPartnerSdkUnmergeProvisionalAccount(
    BotPartnerSdkUnmergeProvisionalAccountRequest
    botPartnerSdkUnmergeProvisionalAccountRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/partner-sdk/provisional-accounts/unmerge/bot',
      body: botPartnerSdkUnmergeProvisionalAccountRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<ProvisionalTokenResponse> partnerSdkToken(
    PartnerSdkTokenRequest partnerSdkTokenRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/partner-sdk/token',
      body: partnerSdkTokenRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ProvisionalTokenResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ProvisionalTokenResponse> botPartnerSdkToken(
    BotPartnerSdkTokenRequest botPartnerSdkTokenRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/partner-sdk/token/bot',
      body: botPartnerSdkTokenRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ProvisionalTokenResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<SoundboardSoundResponse>> getSoundboardDefaultSounds() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/soundboard-default-sounds',
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SoundboardSoundResponse>(
            (e) => SoundboardSoundResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<StageInstanceResponse> createStageInstance(
    CreateStageInstanceRequest createStageInstanceRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/stage-instances',
      body: createStageInstanceRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return StageInstanceResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<StageInstanceResponse> getStageInstance(
    SnowflakeType channelId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/stage-instances/{channel_id}'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return StageInstanceResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteStageInstance(SnowflakeType channelId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/stage-instances/{channel_id}'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<StageInstanceResponse> updateStageInstance(
    SnowflakeType channelId,
    UpdateStageInstanceRequest updateStageInstanceRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/stage-instances/{channel_id}'.replaceAll(
        '{channel_id}',
        Uri.encodeComponent(channelId.toJson()),
      ),
      body: updateStageInstanceRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return StageInstanceResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<StickerPackCollectionResponse> listStickerPacks() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/sticker-packs',
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return StickerPackCollectionResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<StickerPackResponse> getStickerPack(SnowflakeType packId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/sticker-packs/{pack_id}'.replaceAll(
        '{pack_id}',
        Uri.encodeComponent(packId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return StickerPackResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<GetSticker200Response> getSticker(SnowflakeType stickerId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/stickers/{sticker_id}'.replaceAll(
        '{sticker_id}',
        Uri.encodeComponent(stickerId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return GetSticker200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<UserPiiResponse> getMyUser() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/@me',
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return UserPiiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<UserPiiResponse> updateMyUser(
    BotAccountPatchRequest botAccountPatchRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/users/@me',
      body: botAccountPatchRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return UserPiiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<EntitlementResponse>> getCurrentUserApplicationEntitlements(
    SnowflakeType applicationId, {
    GetCurrentUserApplicationEntitlementsParameter0? skuIds,
    bool? excludeConsumed,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/@me/applications/{application_id}/entitlements'.replaceAll(
        '{application_id}',
        Uri.encodeComponent(applicationId.toJson()),
      ),
      queryParameters: {
        if (skuIds != null)
          'sku_ids': switch (skuIds) {
            GetCurrentUserApplicationEntitlementsParameter0String(
              :final value,
            ) =>
              [value],
            GetCurrentUserApplicationEntitlementsParameter0List(:final value) =>
              value.map((e) => e.toJson()).toList(),
          },
        if (excludeConsumed != null)
          'exclude_consumed': [excludeConsumed.toString()],
      },
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<EntitlementResponse>(
            (e) => EntitlementResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ApplicationUserRoleConnectionResponse>
  getApplicationUserRoleConnection(SnowflakeType applicationId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/@me/applications/{application_id}/role-connection'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          ),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ApplicationUserRoleConnectionResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ApplicationUserRoleConnectionResponse>
  updateApplicationUserRoleConnection(
    SnowflakeType applicationId,
    UpdateApplicationUserRoleConnectionRequest
    updateApplicationUserRoleConnectionRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/users/@me/applications/{application_id}/role-connection'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          ),
      body: updateApplicationUserRoleConnectionRequest.toJson(),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ApplicationUserRoleConnectionResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteApplicationUserRoleConnection(
    SnowflakeType applicationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/users/@me/applications/{application_id}/role-connection'
          .replaceAll(
            '{application_id}',
            Uri.encodeComponent(applicationId.toJson()),
          ),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<AddGroupDmUser201Response> createDm(
    CreatePrivateChannelRequest createPrivateChannelRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/users/@me/channels',
      body: createPrivateChannelRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return AddGroupDmUser201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<ConnectedAccountResponse>> listMyConnections() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/@me/connections',
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ConnectedAccountResponse>(
            (e) => ConnectedAccountResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<MyGuildResponse>> listMyGuilds({
    SnowflakeType? before,
    SnowflakeType? after,
    int? limit,
    bool? withCounts,
  }) async {
    limit?.validate(min: 1, max: 200);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/@me/guilds',
      queryParameters: {
        if (before != null) 'before': [before.toJson()],
        if (after != null) 'after': [after.toJson()],
        if (limit != null) 'limit': [limit.toString()],
        if (withCounts != null) 'with_counts': [withCounts.toString()],
      },
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<MyGuildResponse>(
            (e) => MyGuildResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> leaveGuild(SnowflakeType guildId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/users/@me/guilds/{guild_id}'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<PrivateGuildMemberResponse> getMyGuildMember(
    SnowflakeType guildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/@me/guilds/{guild_id}/member'.replaceAll(
        '{guild_id}',
        Uri.encodeComponent(guildId.toJson()),
      ),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return PrivateGuildMemberResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<UserResponse> getUser(SnowflakeType userId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{user_id}'.replaceAll(
        '{user_id}',
        Uri.encodeComponent(userId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return UserResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<List<VoiceRegionResponse>> listVoiceRegions() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/voice/regions',
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<VoiceRegionResponse>(
            (e) => VoiceRegionResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ListChannelWebhooks200ResponseInner> getWebhook(
    SnowflakeType webhookId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/webhooks/{webhook_id}'.replaceAll(
        '{webhook_id}',
        Uri.encodeComponent(webhookId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListChannelWebhooks200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteWebhook(SnowflakeType webhookId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/webhooks/{webhook_id}'.replaceAll(
        '{webhook_id}',
        Uri.encodeComponent(webhookId.toJson()),
      ),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<ListChannelWebhooks200ResponseInner> updateWebhook(
    SnowflakeType webhookId,
    UpdateWebhookRequest updateWebhookRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/webhooks/{webhook_id}'.replaceAll(
        '{webhook_id}',
        Uri.encodeComponent(webhookId.toJson()),
      ),
      body: updateWebhookRequest.toJson(),
      authRequest: const ApiKeyAuth(
        name: 'Authorization',
        secretName: 'BotToken',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListChannelWebhooks200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ListChannelWebhooks200ResponseInner> getWebhookByToken(
    SnowflakeType webhookId,
    String webhookToken,
  ) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/webhooks/{webhook_id}/{webhook_token}'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken)),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListChannelWebhooks200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<ExecuteWebhookResponse> executeWebhook(
    SnowflakeType webhookId,
    String webhookToken,
    ExecuteWebhookRequest executeWebhookRequest, {
    bool? wait,
    SnowflakeType? threadId,
    bool? withComponents,
  }) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.post,
      path: '/webhooks/{webhook_id}/{webhook_token}'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken)),
      queryParameters: {
        if (wait != null) 'wait': [wait.toString()],
        if (threadId != null) 'thread_id': [threadId.toJson()],
        if (withComponents != null)
          'with_components': [withComponents.toString()],
      },
      body: executeWebhookRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    return switch (response.statusCode) {
      200 => ExecuteWebhookResponse200(
        MessageResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const ExecuteWebhookResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  Future<void> deleteWebhookByToken(
    SnowflakeType webhookId,
    String webhookToken,
  ) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.delete,
      path: '/webhooks/{webhook_id}/{webhook_token}'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken)),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<ListChannelWebhooks200ResponseInner> updateWebhookByToken(
    SnowflakeType webhookId,
    String webhookToken,
    UpdateWebhookByTokenRequest updateWebhookByTokenRequest,
  ) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.patch,
      path: '/webhooks/{webhook_id}/{webhook_token}'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken)),
      body: updateWebhookByTokenRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return ListChannelWebhooks200ResponseInner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> executeGithubCompatibleWebhook(
    SnowflakeType webhookId,
    String webhookToken,
    GithubWebhook githubWebhook, {
    bool? wait,
    SnowflakeType? threadId,
  }) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.post,
      path: '/webhooks/{webhook_id}/{webhook_token}/github'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken)),
      queryParameters: {
        if (wait != null) 'wait': [wait.toString()],
        if (threadId != null) 'thread_id': [threadId.toJson()],
      },
      body: githubWebhook.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<MessageResponse> getOriginalWebhookMessage(
    SnowflakeType webhookId,
    String webhookToken, {
    SnowflakeType? threadId,
  }) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/webhooks/{webhook_id}/{webhook_token}/messages/@original'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken)),
      queryParameters: {
        if (threadId != null) 'thread_id': [threadId.toJson()],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return MessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteOriginalWebhookMessage(
    SnowflakeType webhookId,
    String webhookToken, {
    SnowflakeType? threadId,
  }) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.delete,
      path: '/webhooks/{webhook_id}/{webhook_token}/messages/@original'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken)),
      queryParameters: {
        if (threadId != null) 'thread_id': [threadId.toJson()],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<MessageResponse> updateOriginalWebhookMessage(
    SnowflakeType webhookId,
    String webhookToken,
    IncomingWebhookUpdateRequestPartial incomingWebhookUpdateRequestPartial, {
    SnowflakeType? threadId,
    bool? withComponents,
  }) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.patch,
      path: '/webhooks/{webhook_id}/{webhook_token}/messages/@original'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken)),
      queryParameters: {
        if (threadId != null) 'thread_id': [threadId.toJson()],
        if (withComponents != null)
          'with_components': [withComponents.toString()],
      },
      body: incomingWebhookUpdateRequestPartial.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return MessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<MessageResponse> getWebhookMessage(
    SnowflakeType webhookId,
    String webhookToken,
    SnowflakeType messageId, {
    SnowflakeType? threadId,
  }) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      queryParameters: {
        if (threadId != null) 'thread_id': [threadId.toJson()],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return MessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<void> deleteWebhookMessage(
    SnowflakeType webhookId,
    String webhookToken,
    SnowflakeType messageId, {
    SnowflakeType? threadId,
  }) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.delete,
      path: '/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      queryParameters: {
        if (threadId != null) 'thread_id': [threadId.toJson()],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }
  }

  Future<MessageResponse> updateWebhookMessage(
    SnowflakeType webhookId,
    String webhookToken,
    SnowflakeType messageId,
    IncomingWebhookUpdateRequestPartial incomingWebhookUpdateRequestPartial, {
    SnowflakeType? threadId,
    bool? withComponents,
  }) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.patch,
      path: '/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken))
          .replaceAll('{message_id}', Uri.encodeComponent(messageId.toJson())),
      queryParameters: {
        if (threadId != null) 'thread_id': [threadId.toJson()],
        if (withComponents != null)
          'with_components': [withComponents.toString()],
      },
      body: incomingWebhookUpdateRequestPartial.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return MessageResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  Future<String> executeSlackCompatibleWebhook(
    SnowflakeType webhookId,
    String webhookToken,
    SlackWebhook slackWebhook, {
    bool? wait,
    SnowflakeType? threadId,
  }) async {
    webhookToken.validate(maxLength: 152133);

    final response = await client.invokeApi(
      method: Method.post,
      path: '/webhooks/{webhook_id}/{webhook_token}/slack'
          .replaceAll('{webhook_id}', Uri.encodeComponent(webhookId.toJson()))
          .replaceAll('{webhook_token}', Uri.encodeComponent(webhookToken)),
      queryParameters: {
        if (wait != null) 'wait': [wait.toString()],
        if (threadId != null) 'thread_id': [threadId.toJson()],
      },
      body: slackWebhook.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        ApiKeyAuth(
          name: 'Authorization',
          secretName: 'BotToken',
          sendIn: ApiKeyLocation.header,
        ),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<ErrorResponse>(
        response.statusCode,
        response.body,
        body: ErrorResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      );
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body) as String;
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
