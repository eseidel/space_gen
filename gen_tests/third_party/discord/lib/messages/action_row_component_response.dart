import 'package:discord/model_helpers.dart';
import 'package:discord/models/action_row_component_response_components_inner.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

@immutable
class ActionRowComponentResponse {
  const ActionRowComponentResponse({
    required this.id,
    required this.components,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionRowComponentResponse].
  factory ActionRowComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionRowComponentResponse',
      json,
      () => ActionRowComponentResponse(
        id: json['id'] as int,
        components: (json['components'] as List)
            .map<ActionRowComponentResponseComponentsInner>(
              (e) => ActionRowComponentResponseComponentsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionRowComponentResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionRowComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.actionRow;
  final int id;
  final List<ActionRowComponentResponseComponentsInner> components;

  /// Converts an [ActionRowComponentResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'components': components.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, listHash(components)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionRowComponentResponse &&
        id == other.id &&
        listsEqual(components, other.components);
  }
}
