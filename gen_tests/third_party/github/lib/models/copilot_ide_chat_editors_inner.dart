import 'package:github/model_helpers.dart';
import 'package:github/models/copilot_ide_chat_editors_inner_models_inner.dart';
import 'package:meta/meta.dart';

/// {@template copilot_ide_chat_editors_inner}
/// Copilot Chat metrics, for active editors.
/// {@endtemplate}
@immutable
class CopilotIdeChatEditorsInner {
  /// {@macro copilot_ide_chat_editors_inner}
  const CopilotIdeChatEditorsInner({
    this.name,
    this.totalEngagedUsers,
    this.models,
  });

  /// Converts a `Map<String, dynamic>` to a [CopilotIdeChatEditorsInner].
  factory CopilotIdeChatEditorsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CopilotIdeChatEditorsInner',
      json,
      () => CopilotIdeChatEditorsInner(
        name: json['name'] as String?,
        totalEngagedUsers: json['total_engaged_users'] as int?,
        models: (json['models'] as List?)
            ?.map<CopilotIdeChatEditorsInnerModelsInner>(
              (e) => CopilotIdeChatEditorsInnerModelsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CopilotIdeChatEditorsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CopilotIdeChatEditorsInner.fromJson(json);
  }

  /// Name of the given editor.
  final String? name;

  /// The number of users who prompted Copilot Chat in the specified editor.
  final int? totalEngagedUsers;

  /// List of model metrics for custom models and the default model.
  final List<CopilotIdeChatEditorsInnerModelsInner>? models;

  /// Converts a [CopilotIdeChatEditorsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'total_engaged_users': totalEngagedUsers,
      'models': models?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, totalEngagedUsers, listHash(models)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CopilotIdeChatEditorsInner &&
        name == other.name &&
        totalEngagedUsers == other.totalEngagedUsers &&
        listsEqual(models, other.models);
  }
}
