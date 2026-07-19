// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/action_row_component_response.dart';
import 'package:discord/messages/file_component_response.dart';
import 'package:discord/messages/media_gallery_component_response.dart';
import 'package:discord/messages/section_component_response.dart';
import 'package:discord/messages/separator_component_response.dart';
import 'package:discord/messages/text_display_component_response.dart';
import 'package:meta/meta.dart';

sealed class ContainerComponentResponseComponentsInner {
  const ContainerComponentResponseComponentsInner();

  factory ContainerComponentResponseComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => ContainerComponentResponseComponentsInnerActionRowComponentResponse(
        ActionRowComponentResponse.fromJson(json),
      ),
      13 => ContainerComponentResponseComponentsInnerFileComponentResponse(
        FileComponentResponse.fromJson(json),
      ),
      12 =>
        ContainerComponentResponseComponentsInnerMediaGalleryComponentResponse(
          MediaGalleryComponentResponse.fromJson(json),
        ),
      9 => ContainerComponentResponseComponentsInnerSectionComponentResponse(
        SectionComponentResponse.fromJson(json),
      ),
      14 => ContainerComponentResponseComponentsInnerSeparatorComponentResponse(
        SeparatorComponentResponse.fromJson(json),
      ),
      10 =>
        ContainerComponentResponseComponentsInnerTextDisplayComponentResponse(
          TextDisplayComponentResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ContainerComponentResponseComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContainerComponentResponseComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ContainerComponentResponseComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ContainerComponentResponseComponentsInnerActionRowComponentResponse
    extends ContainerComponentResponseComponentsInner {
  const ContainerComponentResponseComponentsInnerActionRowComponentResponse(
    this.value,
  );

  final ActionRowComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ContainerComponentResponseComponentsInnerActionRowComponentResponse &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentResponseComponentsInnerFileComponentResponse
    extends ContainerComponentResponseComponentsInner {
  const ContainerComponentResponseComponentsInnerFileComponentResponse(
    this.value,
  );

  final FileComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ContainerComponentResponseComponentsInnerFileComponentResponse &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentResponseComponentsInnerMediaGalleryComponentResponse
    extends ContainerComponentResponseComponentsInner {
  const ContainerComponentResponseComponentsInnerMediaGalleryComponentResponse(
    this.value,
  );

  final MediaGalleryComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ContainerComponentResponseComponentsInnerMediaGalleryComponentResponse &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentResponseComponentsInnerSectionComponentResponse
    extends ContainerComponentResponseComponentsInner {
  const ContainerComponentResponseComponentsInnerSectionComponentResponse(
    this.value,
  );

  final SectionComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ContainerComponentResponseComponentsInnerSectionComponentResponse &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentResponseComponentsInnerSeparatorComponentResponse
    extends ContainerComponentResponseComponentsInner {
  const ContainerComponentResponseComponentsInnerSeparatorComponentResponse(
    this.value,
  );

  final SeparatorComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ContainerComponentResponseComponentsInnerSeparatorComponentResponse &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentResponseComponentsInnerTextDisplayComponentResponse
    extends ContainerComponentResponseComponentsInner {
  const ContainerComponentResponseComponentsInnerTextDisplayComponentResponse(
    this.value,
  );

  final TextDisplayComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ContainerComponentResponseComponentsInnerTextDisplayComponentResponse &&
        value == other.value;
  }
}
