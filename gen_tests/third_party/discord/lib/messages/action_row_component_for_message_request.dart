import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/action_row_component_for_message_request_components_inner.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

@immutable
class ActionRowComponentForMessageRequest {
  ActionRowComponentForMessageRequest({required this.components, this.id}) {
    id?.validate(min: 0);
    components.validate(minItems: 1, maxItems: 5);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionRowComponentForMessageRequest].
  factory ActionRowComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionRowComponentForMessageRequest',
      json,
      () => ActionRowComponentForMessageRequest(
        id: json['id'] as int?,
        components: (json['components'] as List)
            .map<ActionRowComponentForMessageRequestComponentsInner>(
              (e) =>
                  ActionRowComponentForMessageRequestComponentsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionRowComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionRowComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.actionRow;
  final int? id;
  final List<ActionRowComponentForMessageRequestComponentsInner> components;

  /// Converts an [ActionRowComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
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
    return other is ActionRowComponentForMessageRequest &&
        id == other.id &&
        listsEqual(components, other.components);
  }
}
