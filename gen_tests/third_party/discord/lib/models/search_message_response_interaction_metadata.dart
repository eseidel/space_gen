// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/application_command_interaction_metadata_response.dart';
import 'package:discord/messages/message_component_interaction_metadata_response.dart';
import 'package:discord/messages/modal_submit_interaction_metadata_response.dart';
import 'package:meta/meta.dart';

sealed class SearchMessageResponseInteractionMetadata {
  const SearchMessageResponseInteractionMetadata();

  factory SearchMessageResponseInteractionMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 =>
        SearchMessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse(
          ApplicationCommandInteractionMetadataResponse.fromJson(json),
        ),
      3 =>
        SearchMessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse(
          MessageComponentInteractionMetadataResponse.fromJson(json),
        ),
      5 =>
        SearchMessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse(
          ModalSubmitInteractionMetadataResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for SearchMessageResponseInteractionMetadata",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchMessageResponseInteractionMetadata? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SearchMessageResponseInteractionMetadata.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class SearchMessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse
    extends SearchMessageResponseInteractionMetadata {
  const SearchMessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse(
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
            is SearchMessageResponseInteractionMetadataApplicationCommandInteractionMetadataResponse &&
        value == other.value;
  }
}

@immutable
final class SearchMessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse
    extends SearchMessageResponseInteractionMetadata {
  const SearchMessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse(
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
            is SearchMessageResponseInteractionMetadataMessageComponentInteractionMetadataResponse &&
        value == other.value;
  }
}

@immutable
final class SearchMessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse
    extends SearchMessageResponseInteractionMetadata {
  const SearchMessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse(
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
            is SearchMessageResponseInteractionMetadataModalSubmitInteractionMetadataResponse &&
        value == other.value;
  }
}
