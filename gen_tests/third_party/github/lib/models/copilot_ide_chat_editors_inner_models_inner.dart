import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CopilotIdeChatEditorsInnerModelsInner {
  const CopilotIdeChatEditorsInnerModelsInner({
    this.name,
    this.isCustomModel,
    this.customModelTrainingDate,
    this.totalEngagedUsers,
    this.totalChats,
    this.totalChatInsertionEvents,
    this.totalChatCopyEvents,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CopilotIdeChatEditorsInnerModelsInner].
  factory CopilotIdeChatEditorsInnerModelsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CopilotIdeChatEditorsInnerModelsInner',
      json,
      () => CopilotIdeChatEditorsInnerModelsInner(
        name: json['name'] as String?,
        isCustomModel: json['is_custom_model'] as bool?,
        customModelTrainingDate: json['custom_model_training_date'] as String?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
        totalChats: json['total_chats'] as int?,
        totalChatInsertionEvents: json['total_chat_insertion_events'] as int?,
        totalChatCopyEvents: json['total_chat_copy_events'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotIdeChatEditorsInnerModelsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotIdeChatEditorsInnerModelsInner.fromJson(json);
  }

  /// Name of the model used for Copilot Chat. If the default model is used
  /// will appear as 'default'.
  final String? name;

  /// Indicates whether a model is custom or default.
  final bool? isCustomModel;

  /// The training date for the custom model.
  final String? customModelTrainingDate;

  /// The number of users who prompted Copilot Chat in the given editor and
  /// model.
  final int? totalEngagedUsers;

  /// The total number of chats initiated by users in the given editor and
  /// model.
  final int? totalChats;

  /// The number of times users accepted a code suggestion from Copilot Chat
  /// using the 'Insert Code' UI element, for the given editor.
  final int? totalChatInsertionEvents;

  /// The number of times users copied a code suggestion from Copilot Chat
  /// using the keyboard, or the 'Copy' UI element, for the given editor.
  final int? totalChatCopyEvents;

  /// Converts a [CopilotIdeChatEditorsInnerModelsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'is_custom_model': ?isCustomModel,
      'custom_model_training_date': customModelTrainingDate,
      'total_engaged_users': ?totalEngagedUsers,
      'total_chats': ?totalChats,
      'total_chat_insertion_events': ?totalChatInsertionEvents,
      'total_chat_copy_events': ?totalChatCopyEvents,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    isCustomModel,
    customModelTrainingDate,
    totalEngagedUsers,
    totalChats,
    totalChatInsertionEvents,
    totalChatCopyEvents,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotIdeChatEditorsInnerModelsInner &&
        name == other.name &&
        isCustomModel == other.isCustomModel &&
        customModelTrainingDate == other.customModelTrainingDate &&
        totalEngagedUsers == other.totalEngagedUsers &&
        totalChats == other.totalChats &&
        totalChatInsertionEvents == other.totalChatInsertionEvents &&
        totalChatCopyEvents == other.totalChatCopyEvents;
  }
}
