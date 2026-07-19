import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_share_custom_user_theme_base_theme.dart';
import 'package:meta/meta.dart';

@immutable
class CustomClientThemeShareRequest {
  const CustomClientThemeShareRequest({
    required this.colors,
    required this.gradientAngle,
    required this.baseMix,
    this.baseTheme,
  });

  /// Converts a `Map<String, dynamic>` to a [CustomClientThemeShareRequest].
  factory CustomClientThemeShareRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CustomClientThemeShareRequest',
      json,
      () => CustomClientThemeShareRequest(
        colors: (json['colors'] as List).cast<String>(),
        gradientAngle: json['gradient_angle'] as int,
        baseMix: json['base_mix'] as int,
        baseTheme: MessageShareCustomUserThemeBaseTheme.maybeFromJson(
          json['base_theme'] as int?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CustomClientThemeShareRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CustomClientThemeShareRequest.fromJson(json);
  }

  final List<String> colors;
  final int gradientAngle;
  final int baseMix;
  final MessageShareCustomUserThemeBaseTheme? baseTheme;

  /// Converts a [CustomClientThemeShareRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'colors': colors,
      'gradient_angle': gradientAngle,
      'base_mix': baseMix,
      'base_theme': baseTheme?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(colors), gradientAngle, baseMix, baseTheme]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomClientThemeShareRequest &&
        listsEqual(colors, other.colors) &&
        gradientAngle == other.gradientAngle &&
        baseMix == other.baseMix &&
        baseTheme == other.baseTheme;
  }
}
