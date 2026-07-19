import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_share_custom_user_theme_base_theme.dart';
import 'package:meta/meta.dart';

@immutable
class CustomClientThemeResponse {
  const CustomClientThemeResponse({
    required this.colors,
    required this.gradientAngle,
    required this.baseMix,
    required this.baseTheme,
  });

  /// Converts a `Map<String, dynamic>` to a [CustomClientThemeResponse].
  factory CustomClientThemeResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CustomClientThemeResponse',
      json,
      () => CustomClientThemeResponse(
        colors: (json['colors'] as List).cast<String>(),
        gradientAngle: json['gradient_angle'] as int,
        baseMix: json['base_mix'] as int,
        baseTheme: MessageShareCustomUserThemeBaseTheme.fromJson(
          json['base_theme'] as int,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CustomClientThemeResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CustomClientThemeResponse.fromJson(json);
  }

  final List<String> colors;
  final int gradientAngle;
  final int baseMix;
  final MessageShareCustomUserThemeBaseTheme baseTheme;

  /// Converts a [CustomClientThemeResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'colors': colors,
      'gradient_angle': gradientAngle,
      'base_mix': baseMix,
      'base_theme': baseTheme.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(colors), gradientAngle, baseMix, baseTheme]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomClientThemeResponse &&
        listsEqual(colors, other.colors) &&
        gradientAngle == other.gradientAngle &&
        baseMix == other.baseMix &&
        baseTheme == other.baseTheme;
  }
}
