import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GuildTemplateRoleColorsResponse {
  const GuildTemplateRoleColorsResponse({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildTemplateRoleColorsResponse].
  factory GuildTemplateRoleColorsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildTemplateRoleColorsResponse',
      json,
      () => GuildTemplateRoleColorsResponse(
        primaryColor: json['primary_color'] as int,
        secondaryColor: checkedKey(json, 'secondary_color') as int?,
        tertiaryColor: checkedKey(json, 'tertiary_color') as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildTemplateRoleColorsResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GuildTemplateRoleColorsResponse.fromJson(json);
  }

  final int primaryColor;
  final int? secondaryColor;
  final int? tertiaryColor;

  /// Converts a [GuildTemplateRoleColorsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'primary_color': primaryColor,
      'secondary_color': secondaryColor,
      'tertiary_color': tertiaryColor,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([primaryColor, secondaryColor, tertiaryColor]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildTemplateRoleColorsResponse &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor &&
        tertiaryColor == other.tertiaryColor;
  }
}
