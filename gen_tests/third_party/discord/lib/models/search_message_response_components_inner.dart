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

sealed class SearchMessageResponseComponentsInner {
  const SearchMessageResponseComponentsInner();

  factory SearchMessageResponseComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => SearchMessageResponseComponentsInnerActionRowComponentResponse(
        ActionRowComponentResponse.fromJson(json),
      ),
      17 => SearchMessageResponseComponentsInnerContainerComponentResponse(
        ContainerComponentResponse.fromJson(json),
      ),
      13 => SearchMessageResponseComponentsInnerFileComponentResponse(
        FileComponentResponse.fromJson(json),
      ),
      12 => SearchMessageResponseComponentsInnerMediaGalleryComponentResponse(
        MediaGalleryComponentResponse.fromJson(json),
      ),
      9 => SearchMessageResponseComponentsInnerSectionComponentResponse(
        SectionComponentResponse.fromJson(json),
      ),
      14 => SearchMessageResponseComponentsInnerSeparatorComponentResponse(
        SeparatorComponentResponse.fromJson(json),
      ),
      10 => SearchMessageResponseComponentsInnerTextDisplayComponentResponse(
        TextDisplayComponentResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for SearchMessageResponseComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SearchMessageResponseComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SearchMessageResponseComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class SearchMessageResponseComponentsInnerActionRowComponentResponse
    extends SearchMessageResponseComponentsInner {
  const SearchMessageResponseComponentsInnerActionRowComponentResponse(
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
            is SearchMessageResponseComponentsInnerActionRowComponentResponse &&
        value == other.value;
  }
}

@immutable
final class SearchMessageResponseComponentsInnerContainerComponentResponse
    extends SearchMessageResponseComponentsInner {
  const SearchMessageResponseComponentsInnerContainerComponentResponse(
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
            is SearchMessageResponseComponentsInnerContainerComponentResponse &&
        value == other.value;
  }
}

@immutable
final class SearchMessageResponseComponentsInnerFileComponentResponse
    extends SearchMessageResponseComponentsInner {
  const SearchMessageResponseComponentsInnerFileComponentResponse(this.value);

  final FileComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchMessageResponseComponentsInnerFileComponentResponse &&
        value == other.value;
  }
}

@immutable
final class SearchMessageResponseComponentsInnerMediaGalleryComponentResponse
    extends SearchMessageResponseComponentsInner {
  const SearchMessageResponseComponentsInnerMediaGalleryComponentResponse(
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
            is SearchMessageResponseComponentsInnerMediaGalleryComponentResponse &&
        value == other.value;
  }
}

@immutable
final class SearchMessageResponseComponentsInnerSectionComponentResponse
    extends SearchMessageResponseComponentsInner {
  const SearchMessageResponseComponentsInnerSectionComponentResponse(
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
            is SearchMessageResponseComponentsInnerSectionComponentResponse &&
        value == other.value;
  }
}

@immutable
final class SearchMessageResponseComponentsInnerSeparatorComponentResponse
    extends SearchMessageResponseComponentsInner {
  const SearchMessageResponseComponentsInnerSeparatorComponentResponse(
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
            is SearchMessageResponseComponentsInnerSeparatorComponentResponse &&
        value == other.value;
  }
}

@immutable
final class SearchMessageResponseComponentsInnerTextDisplayComponentResponse
    extends SearchMessageResponseComponentsInner {
  const SearchMessageResponseComponentsInnerTextDisplayComponentResponse(
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
            is SearchMessageResponseComponentsInnerTextDisplayComponentResponse &&
        value == other.value;
  }
}
