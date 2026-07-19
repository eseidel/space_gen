// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/action_row_component_response.dart';
import 'package:discord/messages/container_component_response.dart';
import 'package:discord/messages/file_component_response.dart';
import 'package:discord/messages/media_gallery_component_response.dart';
import 'package:discord/messages/section_component_response.dart';
import 'package:discord/messages/separator_component_response.dart';
import 'package:discord/messages/text_display_component_response.dart';
import 'package:meta/meta.dart';

sealed class MinimalContentMessageResponseComponentsInner {
  const MinimalContentMessageResponseComponentsInner();

  factory MinimalContentMessageResponseComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 =>
        MinimalContentMessageResponseComponentsInnerActionRowComponentResponse(
          ActionRowComponentResponse.fromJson(json),
        ),
      17 =>
        MinimalContentMessageResponseComponentsInnerContainerComponentResponse(
          ContainerComponentResponse.fromJson(json),
        ),
      13 => MinimalContentMessageResponseComponentsInnerFileComponentResponse(
        FileComponentResponse.fromJson(json),
      ),
      12 =>
        MinimalContentMessageResponseComponentsInnerMediaGalleryComponentResponse(
          MediaGalleryComponentResponse.fromJson(json),
        ),
      9 => MinimalContentMessageResponseComponentsInnerSectionComponentResponse(
        SectionComponentResponse.fromJson(json),
      ),
      14 =>
        MinimalContentMessageResponseComponentsInnerSeparatorComponentResponse(
          SeparatorComponentResponse.fromJson(json),
        ),
      10 =>
        MinimalContentMessageResponseComponentsInnerTextDisplayComponentResponse(
          TextDisplayComponentResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MinimalContentMessageResponseComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MinimalContentMessageResponseComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MinimalContentMessageResponseComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MinimalContentMessageResponseComponentsInnerActionRowComponentResponse
    extends MinimalContentMessageResponseComponentsInner {
  const MinimalContentMessageResponseComponentsInnerActionRowComponentResponse(
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
            is MinimalContentMessageResponseComponentsInnerActionRowComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MinimalContentMessageResponseComponentsInnerContainerComponentResponse
    extends MinimalContentMessageResponseComponentsInner {
  const MinimalContentMessageResponseComponentsInnerContainerComponentResponse(
    this.value,
  );

  final ContainerComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MinimalContentMessageResponseComponentsInnerContainerComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MinimalContentMessageResponseComponentsInnerFileComponentResponse
    extends MinimalContentMessageResponseComponentsInner {
  const MinimalContentMessageResponseComponentsInnerFileComponentResponse(
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
            is MinimalContentMessageResponseComponentsInnerFileComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MinimalContentMessageResponseComponentsInnerMediaGalleryComponentResponse
    extends MinimalContentMessageResponseComponentsInner {
  const MinimalContentMessageResponseComponentsInnerMediaGalleryComponentResponse(
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
            is MinimalContentMessageResponseComponentsInnerMediaGalleryComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MinimalContentMessageResponseComponentsInnerSectionComponentResponse
    extends MinimalContentMessageResponseComponentsInner {
  const MinimalContentMessageResponseComponentsInnerSectionComponentResponse(
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
            is MinimalContentMessageResponseComponentsInnerSectionComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MinimalContentMessageResponseComponentsInnerSeparatorComponentResponse
    extends MinimalContentMessageResponseComponentsInner {
  const MinimalContentMessageResponseComponentsInnerSeparatorComponentResponse(
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
            is MinimalContentMessageResponseComponentsInnerSeparatorComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MinimalContentMessageResponseComponentsInnerTextDisplayComponentResponse
    extends MinimalContentMessageResponseComponentsInner {
  const MinimalContentMessageResponseComponentsInnerTextDisplayComponentResponse(
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
            is MinimalContentMessageResponseComponentsInnerTextDisplayComponentResponse &&
        value == other.value;
  }
}
