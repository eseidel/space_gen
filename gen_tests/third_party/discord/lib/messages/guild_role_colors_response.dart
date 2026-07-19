import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GuildRoleColorsResponse {
  const GuildRoleColorsResponse({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildRoleColorsResponse].
  factory GuildRoleColorsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildRoleColorsResponse',
      json,
      () => GuildRoleColorsResponse(
        primaryColor: json['primary_color'] as int,
        secondaryColor: checkedKey(json, 'secondary_color') as int?,
        tertiaryColor: checkedKey(json, 'tertiary_color') as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildRoleColorsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildRoleColorsResponse.fromJson(json);
  }

  final int primaryColor;
  final int? secondaryColor;
  final int? tertiaryColor;

  /// Converts a [GuildRoleColorsResponse] to a `Map<String, dynamic>`.
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
    return other is GuildRoleColorsResponse &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor &&
        tertiaryColor == other.tertiaryColor;
  }
}
