import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RoleColors {
  RoleColors({this.primaryColor, this.secondaryColor, this.tertiaryColor}) {
    primaryColor?.validate(min: 0, max: 16777215);
    secondaryColor?.validate(min: 0, max: 16777215);
    tertiaryColor?.validate(min: 0, max: 16777215);
  }

  /// Converts a `Map<String, dynamic>` to a [RoleColors].
  factory RoleColors.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RoleColors',
      json,
      () => RoleColors(
        primaryColor: json['primary_color'] as int?,
        secondaryColor: json['secondary_color'] as int?,
        tertiaryColor: json['tertiary_color'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RoleColors? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RoleColors.fromJson(json);
  }

  final int? primaryColor;
  final int? secondaryColor;
  final int? tertiaryColor;

  /// Converts a [RoleColors] to a `Map<String, dynamic>`.
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
    return other is RoleColors &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor &&
        tertiaryColor == other.tertiaryColor;
  }
}
