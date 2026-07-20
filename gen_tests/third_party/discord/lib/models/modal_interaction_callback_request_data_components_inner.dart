// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/api_exception.dart';
import 'package:discord/messages/text_input_component_for_modal_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/label_component_for_modal_request_component.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

sealed class ModalInteractionCallbackRequestDataComponentsInner {
  const ModalInteractionCallbackRequestDataComponentsInner();

  factory ModalInteractionCallbackRequestDataComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => ActionRowComponentForModalRequest.fromJson(json),
      18 => LabelComponentForModalRequest.fromJson(json),
      10 => TextDisplayComponentForModalRequest.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ModalInteractionCallbackRequestDataComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ModalInteractionCallbackRequestDataComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ModalInteractionCallbackRequestDataComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ActionRowComponentForModalRequest
    extends ModalInteractionCallbackRequestDataComponentsInner {
  ActionRowComponentForModalRequest({required this.components, this.id}) {
    id?.validate(min: 0);
    components.validate(minItems: 1, maxItems: 5);
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionRowComponentForModalRequest].
  factory ActionRowComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionRowComponentForModalRequest',
      json,
      () => ActionRowComponentForModalRequest(
        id: json['id'] as int?,
        components: (json['components'] as List)
            .map<TextInputComponentForModalRequest>(
              (e) => TextInputComponentForModalRequest.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionRowComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionRowComponentForModalRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.actionRow;
  final int? id;
  final List<TextInputComponentForModalRequest> components;

  /// Converts an [ActionRowComponentForModalRequest]
  /// to a `Map<String, dynamic>`.
  @override
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
    return other is ActionRowComponentForModalRequest &&
        id == other.id &&
        listsEqual(components, other.components);
  }
}

@immutable
final class LabelComponentForModalRequest
    extends ModalInteractionCallbackRequestDataComponentsInner {
  LabelComponentForModalRequest({
    required this.label,
    required this.component,
    this.id,
    this.description,
  }) {
    id?.validate(min: 0);
    label.validate(minLength: 1, maxLength: 45);
    description?.validate(minLength: 1, maxLength: 100);
  }

  /// Converts a `Map<String, dynamic>` to a [LabelComponentForModalRequest].
  factory LabelComponentForModalRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LabelComponentForModalRequest',
      json,
      () => LabelComponentForModalRequest(
        id: json['id'] as int?,
        label: json['label'] as String,
        description: json['description'] as String?,
        component: LabelComponentForModalRequestComponent.fromJson(
          json['component'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LabelComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return LabelComponentForModalRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.label;
  final int? id;
  final String label;
  final String? description;
  final LabelComponentForModalRequestComponent component;

  /// Converts a [LabelComponentForModalRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'label': label,
      'description': description,
      'component': component.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, label, description, component]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LabelComponentForModalRequest &&
        id == other.id &&
        label == other.label &&
        description == other.description &&
        component == other.component;
  }
}

@immutable
final class TextDisplayComponentForModalRequest
    extends ModalInteractionCallbackRequestDataComponentsInner {
  TextDisplayComponentForModalRequest({required this.content, this.id}) {
    id?.validate(min: 0);
    content.validate(minLength: 1, maxLength: 4000);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [TextDisplayComponentForModalRequest].
  factory TextDisplayComponentForModalRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TextDisplayComponentForModalRequest',
      json,
      () => TextDisplayComponentForModalRequest(
        id: json['id'] as int?,
        content: json['content'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TextDisplayComponentForModalRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TextDisplayComponentForModalRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.textDisplay;
  final int? id;
  final String content;

  /// Converts a [TextDisplayComponentForModalRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'id': id, 'content': content};
  }

  @override
  int get hashCode => Object.hashAll([id, content]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TextDisplayComponentForModalRequest &&
        id == other.id &&
        content == other.content;
  }
}
