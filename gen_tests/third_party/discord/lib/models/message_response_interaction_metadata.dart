// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/application_command_interaction_metadata_response.dart';
import 'package:discord/messages/message_component_interaction_metadata_response.dart';
import 'package:discord/messages/modal_submit_interaction_metadata_response.dart';
import 'package:meta/meta.dart';

sealed class MessageResponseInteractionMetadata {
  const MessageResponseInteractionMetadata();

  factory MessageResponseInteractionMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 =>
        MessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse(
          ApplicationCommandInteractionMetadataResponse.fromJson(json),
        ),
      3 =>
        MessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse(
          MessageComponentInteractionMetadataResponse.fromJson(json),
        ),
      5 =>
        MessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse(
          ModalSubmitInteractionMetadataResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MessageResponseInteractionMetadata",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageResponseInteractionMetadata? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageResponseInteractionMetadata.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse
    extends MessageResponseInteractionMetadata {
  const MessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse(
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
            is MessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse &&
        value == other.value;
  }
}

@immutable
final class MessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse
    extends MessageResponseInteractionMetadata {
  const MessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse(
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
            is MessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse &&
        value == other.value;
  }
}

@immutable
final class MessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse
    extends MessageResponseInteractionMetadata {
  const MessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse(
    this.value,
  );

  final ModalSubmitInteractionMetadataResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse &&
        value == other.value;
  }
}
