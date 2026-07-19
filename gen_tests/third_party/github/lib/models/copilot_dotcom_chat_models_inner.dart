import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CopilotDotcomChatModelsInner {
  const CopilotDotcomChatModelsInner({
    this.name,
    this.isCustomModel,
    this.customModelTrainingDate,
    this.totalEngagedUsers,
    this.totalChats,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotDotcomChatModelsInner].
  factory CopilotDotcomChatModelsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotDotcomChatModelsInner',
      json,
      () => CopilotDotcomChatModelsInner(
        name: json['name'] as String?,
        isCustomModel: json['is_custom_model'] as bool?,
        customModelTrainingDate: json['custom_model_training_date'] as String?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
        totalChats: json['total_chats'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotDotcomChatModelsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CopilotDotcomChatModelsInner.fromJson(json);
  }

  /// Name of the model used for Copilot Chat. If the default model is used
  /// will appear as 'default'.
  final String? name;

  /// Indicates whether a model is custom or default.
  final bool? isCustomModel;

  /// The training date for the custom model (if applicable).
  final String? customModelTrainingDate;

  /// Total number of users who prompted Copilot Chat on github.com at least
  /// once for each model.
  final int? totalEngagedUsers;

  /// Total number of chats initiated by users on github.com.
  final int? totalChats;

  /// Converts a [CopilotDotcomChatModelsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (isCustomModel != null) 'is_custom_model': isCustomModel,
      'custom_model_training_date': customModelTrainingDate,
      if (totalEngagedUsers != null) 'total_engaged_users': totalEngagedUsers,
      if (totalChats != null) 'total_chats': totalChats,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    isCustomModel,
    customModelTrainingDate,
    totalEngagedUsers,
    totalChats,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotDotcomChatModelsInner &&
        name == other.name &&
        isCustomModel == other.isCustomModel &&
        customModelTrainingDate == other.customModelTrainingDate &&
        totalEngagedUsers == other.totalEngagedUsers &&
        totalChats == other.totalChats;
  }
}
