import 'package:discord/messages/basic_application_response.dart';
import 'package:discord/messages/custom_client_theme_response.dart';
import 'package:discord/messages/message_activity_response.dart';
import 'package:discord/messages/message_attachment_response.dart';
import 'package:discord/messages/message_call_response.dart';
import 'package:discord/messages/message_embed_response.dart';
import 'package:discord/messages/message_interaction_response.dart';
import 'package:discord/messages/message_mention_channel_response.dart';
import 'package:discord/messages/message_reference_response.dart';
import 'package:discord/messages/message_role_subscription_data_response.dart';
import 'package:discord/messages/message_snapshot_response.dart';
import 'package:discord/messages/message_sticker_item_response.dart';
import 'package:discord/messages/poll_response.dart';
import 'package:discord/messages/purchase_notification_response.dart';
import 'package:discord/messages/resolved_objects_response.dart';
import 'package:discord/messages/thread_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/basic_message_response_components_inner.dart';
import 'package:discord/models/basic_message_response_interaction_metadata.dart';
import 'package:discord/models/basic_message_response_nonce.dart';
import 'package:discord/models/basic_message_response_stickers_inner.dart';
import 'package:discord/models/message_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class BasicMessageResponse {
  const BasicMessageResponse({
    required this.type,
    required this.content,
    required this.mentions,
    required this.mentionRoles,
    required this.attachments,
    required this.embeds,
    required this.timestamp,
    required this.editedTimestamp,
    required this.flags,
    required this.components,
    required this.id,
    required this.channelId,
    required this.author,
    required this.pinned,
    required this.mentionEveryone,
    required this.tts,
    this.stickers,
    this.stickerItems,
    this.call,
    this.activity,
    this.application,
    this.applicationId,
    this.interaction,
    this.nonce,
    this.webhookId,
    this.messageReference,
    this.thread,
    this.mentionChannels,
    this.roleSubscriptionData,
    this.purchaseNotification,
    this.position,
    this.resolved,
    this.poll,
    this.sharedClientTheme,
    this.interactionMetadata,
    this.messageSnapshots,
  });

  /// Converts a `Map<String, dynamic>` to a [BasicMessageResponse].
  factory BasicMessageResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BasicMessageResponse',
      json,
      () => BasicMessageResponse(
        type: MessageType.fromJson(json['type'] as int),
        content: json['content'] as String,
        mentions: (json['mentions'] as List)
            .map<UserResponse>(
              (e) => UserResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        mentionRoles: (json['mention_roles'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        attachments: (json['attachments'] as List)
            .map<MessageAttachmentResponse>(
              (e) =>
                  MessageAttachmentResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        embeds: (json['embeds'] as List)
            .map<MessageEmbedResponse>(
              (e) => MessageEmbedResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        timestamp: DateTime.parse(json['timestamp'] as String),
        editedTimestamp: maybeParseDateTime(
          checkedKey(json, 'edited_timestamp') as String?,
        ),
        flags: json['flags'] as int,
        components: (json['components'] as List)
            .map<BasicMessageResponseComponentsInner>(
              (e) => BasicMessageResponseComponentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        stickers: (json['stickers'] as List?)
            ?.map<BasicMessageResponseStickersInner>(
              (e) => BasicMessageResponseStickersInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        stickerItems: (json['sticker_items'] as List?)
            ?.map<MessageStickerItemResponse>(
              (e) => MessageStickerItemResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        id: SnowflakeType.fromJson(json['id'] as String),
        channelId: SnowflakeType.fromJson(json['channel_id'] as String),
        author: UserResponse.fromJson(json['author'] as Map<String, dynamic>),
        pinned: json['pinned'] as bool,
        mentionEveryone: json['mention_everyone'] as bool,
        tts: json['tts'] as bool,
        call: MessageCallResponse.maybeFromJson(
          json['call'] as Map<String, dynamic>?,
        ),
        activity: MessageActivityResponse.maybeFromJson(
          json['activity'] as Map<String, dynamic>?,
        ),
        application: BasicApplicationResponse.maybeFromJson(
          json['application'] as Map<String, dynamic>?,
        ),
        applicationId: SnowflakeType.maybeFromJson(
          json['application_id'] as String?,
        ),
        interaction: MessageInteractionResponse.maybeFromJson(
          json['interaction'] as Map<String, dynamic>?,
        ),
        nonce: BasicMessageResponseNonce.maybeFromJson(
          json['nonce'] as Map<String, dynamic>?,
        ),
        webhookId: SnowflakeType.maybeFromJson(json['webhook_id'] as String?),
        messageReference: MessageReferenceResponse.maybeFromJson(
          json['message_reference'] as Map<String, dynamic>?,
        ),
        thread: ThreadResponse.maybeFromJson(
          json['thread'] as Map<String, dynamic>?,
        ),
        mentionChannels: (json['mention_channels'] as List?)
            ?.map<MessageMentionChannelResponse>(
              (e) => MessageMentionChannelResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        roleSubscriptionData: MessageRoleSubscriptionDataResponse.maybeFromJson(
          json['role_subscription_data'] as Map<String, dynamic>?,
        ),
        purchaseNotification: PurchaseNotificationResponse.maybeFromJson(
          json['purchase_notification'] as Map<String, dynamic>?,
        ),
        position: json['position'] as int?,
        resolved: ResolvedObjectsResponse.maybeFromJson(
          json['resolved'] as Map<String, dynamic>?,
        ),
        poll: PollResponse.maybeFromJson(json['poll'] as Map<String, dynamic>?),
        sharedClientTheme: CustomClientThemeResponse.maybeFromJson(
          json['shared_client_theme'] as Map<String, dynamic>?,
        ),
        interactionMetadata:
            BasicMessageResponseInteractionMetadata.maybeFromJson(
              json['interaction_metadata'] as Map<String, dynamic>?,
            ),
        messageSnapshots: (json['message_snapshots'] as List?)
            ?.map<MessageSnapshotResponse>(
              (e) =>
                  MessageSnapshotResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BasicMessageResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BasicMessageResponse.fromJson(json);
  }

  final MessageType type;
  final String content;
  final List<UserResponse> mentions;
  final List<SnowflakeType> mentionRoles;
  final List<MessageAttachmentResponse> attachments;
  final List<MessageEmbedResponse> embeds;
  final DateTime timestamp;
  final DateTime? editedTimestamp;
  final int flags;
  final List<BasicMessageResponseComponentsInner> components;
  final List<BasicMessageResponseStickersInner>? stickers;
  final List<MessageStickerItemResponse>? stickerItems;
  final SnowflakeType id;
  final SnowflakeType channelId;
  final UserResponse author;
  final bool pinned;
  final bool mentionEveryone;
  final bool tts;
  final MessageCallResponse? call;
  final MessageActivityResponse? activity;
  final BasicApplicationResponse? application;
  final SnowflakeType? applicationId;
  final MessageInteractionResponse? interaction;
  final BasicMessageResponseNonce? nonce;
  final SnowflakeType? webhookId;
  final MessageReferenceResponse? messageReference;
  final ThreadResponse? thread;
  final List<MessageMentionChannelResponse>? mentionChannels;
  final MessageRoleSubscriptionDataResponse? roleSubscriptionData;
  final PurchaseNotificationResponse? purchaseNotification;
  final int? position;
  final ResolvedObjectsResponse? resolved;
  final PollResponse? poll;
  final CustomClientThemeResponse? sharedClientTheme;
  final BasicMessageResponseInteractionMetadata? interactionMetadata;
  final List<MessageSnapshotResponse>? messageSnapshots;

  /// Converts a [BasicMessageResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'content': content,
      'mentions': mentions.map((e) => e.toJson()).toList(),
      'mention_roles': mentionRoles.map((e) => e.toJson()).toList(),
      'attachments': attachments.map((e) => e.toJson()).toList(),
      'embeds': embeds.map((e) => e.toJson()).toList(),
      'timestamp': timestamp.toIso8601String(),
      'edited_timestamp': editedTimestamp?.toIso8601String(),
      'flags': flags,
      'components': components.map((e) => e.toJson()).toList(),
      'stickers': ?stickers?.map((e) => e.toJson()).toList(),
      'sticker_items': ?stickerItems?.map((e) => e.toJson()).toList(),
      'id': id.toJson(),
      'channel_id': channelId.toJson(),
      'author': author.toJson(),
      'pinned': pinned,
      'mention_everyone': mentionEveryone,
      'tts': tts,
      'call': ?call?.toJson(),
      'activity': ?activity?.toJson(),
      'application': ?application?.toJson(),
      'application_id': ?applicationId?.toJson(),
      'interaction': ?interaction?.toJson(),
      'nonce': ?nonce?.toJson(),
      'webhook_id': ?webhookId?.toJson(),
      'message_reference': ?messageReference?.toJson(),
      'thread': ?thread?.toJson(),
      'mention_channels': ?mentionChannels?.map((e) => e.toJson()).toList(),
      'role_subscription_data': ?roleSubscriptionData?.toJson(),
      'purchase_notification': ?purchaseNotification?.toJson(),
      'position': ?position,
      'resolved': ?resolved?.toJson(),
      'poll': ?poll?.toJson(),
      'shared_client_theme': ?sharedClientTheme?.toJson(),
      'interaction_metadata': ?interactionMetadata?.toJson(),
      'message_snapshots': ?messageSnapshots?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    content,
    listHash(mentions),
    listHash(mentionRoles),
    listHash(attachments),
    listHash(embeds),
    timestamp,
    editedTimestamp,
    flags,
    listHash(components),
    listHash(stickers),
    listHash(stickerItems),
    id,
    channelId,
    author,
    pinned,
    mentionEveryone,
    tts,
    call,
    activity,
    application,
    applicationId,
    interaction,
    nonce,
    webhookId,
    messageReference,
    thread,
    listHash(mentionChannels),
    roleSubscriptionData,
    purchaseNotification,
    position,
    resolved,
    poll,
    sharedClientTheme,
    interactionMetadata,
    listHash(messageSnapshots),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BasicMessageResponse &&
        type == other.type &&
        content == other.content &&
        listsEqual(mentions, other.mentions) &&
        listsEqual(mentionRoles, other.mentionRoles) &&
        listsEqual(attachments, other.attachments) &&
        listsEqual(embeds, other.embeds) &&
        timestamp == other.timestamp &&
        editedTimestamp == other.editedTimestamp &&
        flags == other.flags &&
        listsEqual(components, other.components) &&
        listsEqual(stickers, other.stickers) &&
        listsEqual(stickerItems, other.stickerItems) &&
        id == other.id &&
        channelId == other.channelId &&
        author == other.author &&
        pinned == other.pinned &&
        mentionEveryone == other.mentionEveryone &&
        tts == other.tts &&
        call == other.call &&
        activity == other.activity &&
        application == other.application &&
        applicationId == other.applicationId &&
        interaction == other.interaction &&
        nonce == other.nonce &&
        webhookId == other.webhookId &&
        messageReference == other.messageReference &&
        thread == other.thread &&
        listsEqual(mentionChannels, other.mentionChannels) &&
        roleSubscriptionData == other.roleSubscriptionData &&
        purchaseNotification == other.purchaseNotification &&
        position == other.position &&
        resolved == other.resolved &&
        poll == other.poll &&
        sharedClientTheme == other.sharedClientTheme &&
        interactionMetadata == other.interactionMetadata &&
        listsEqual(messageSnapshots, other.messageSnapshots);
  }
}
