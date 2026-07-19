// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/application_command_interaction_metadata_response.dart';
import 'package:discord/messages/message_component_interaction_metadata_response.dart';
import 'package:discord/messages/modal_submit_interaction_metadata_response.dart';
import 'package:meta/meta.dart';

sealed class BasicMessageResponseInteractionMetadata {
  const BasicMessageResponseInteractionMetadata();

  factory BasicMessageResponseInteractionMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 =>
        BasicMessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse(
          ApplicationCommandInteractionMetadataResponse.fromJson(json),
        ),
      3 =>
        BasicMessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse(
          MessageComponentInteractionMetadataResponse.fromJson(json),
        ),
      5 =>
        BasicMessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse(
          ModalSubmitInteractionMetadataResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for BasicMessageResponseInteractionMetadata",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BasicMessageResponseInteractionMetadata? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BasicMessageResponseInteractionMetadata.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class BasicMessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse
    extends BasicMessageResponseInteractionMetadata {
  const BasicMessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse(
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
            is BasicMessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse &&
        value == other.value;
  }
}

@immutable
final class BasicMessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse
    extends BasicMessageResponseInteractionMetadata {
  const BasicMessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse(
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
            is BasicMessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse &&
        value == other.value;
  }
}

@immutable
final class BasicMessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse
    extends BasicMessageResponseInteractionMetadata {
  const BasicMessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse(
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
            is BasicMessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse &&
        value == other.value;
  }
}
