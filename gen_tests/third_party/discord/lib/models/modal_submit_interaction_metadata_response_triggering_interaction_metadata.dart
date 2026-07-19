// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/application_command_interaction_metadata_response.dart';
import 'package:discord/messages/message_component_interaction_metadata_response.dart';
import 'package:meta/meta.dart';

sealed class ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata {
  const ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata();

  factory ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 =>
        ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadataApplicationCommandInteractionMetadataResponse(
          ApplicationCommandInteractionMetadataResponse.fromJson(json),
        ),
      3 =>
        ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadataMessageComponentInteractionMetadataResponse(
          MessageComponentInteractionMetadataResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata.fromJson(
      json,
    );
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadataApplicationCommandInteractionMetadataResponse
    extends
        ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata {
  const ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadataApplicationCommandInteractionMetadataResponse(
    this.value,
  );

  final ApplicationCommandInteractionMetadataResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadataApplicationCommandInteractionMetadataResponse &&
        value == other.value;
  }
}

@immutable
final class ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadataMessageComponentInteractionMetadataResponse
    extends
        ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadata {
  const ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadataMessageComponentInteractionMetadataResponse(
    this.value,
  );

  final MessageComponentInteractionMetadataResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ModalSubmitInteractionMetadataResponseTriggeringInteractionMetadataMessageComponentInteractionMetadataResponse &&
        value == other.value;
  }
}
