// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/role_select_default_value.dart';
import 'package:discord/models/user_select_default_value.dart';
import 'package:meta/meta.dart';

sealed class MentionableSelectComponentForModalRequestDefaultValuesInner {
  const MentionableSelectComponentForModalRequestDefaultValuesInner();

  factory MentionableSelectComponentForModalRequestDefaultValuesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      'role' =>
        MentionableSelectComponentForModalRequestDefaultValuesInnerRoleSelectDefaultValue(
          RoleSelectDefaultValue.fromJson(json),
        ),
      'user' =>
        MentionableSelectComponentForModalRequestDefaultValuesInnerUserSelectDefaultValue(
          UserSelectDefaultValue.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MentionableSelectComponentForModalRequestDefaultValuesInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionableSelectComponentForModalRequestDefaultValuesInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MentionableSelectComponentForModalRequestDefaultValuesInner.fromJson(
      json,
    );
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MentionableSelectComponentForModalRequestDefaultValuesInnerRoleSelectDefaultValue
    extends MentionableSelectComponentForModalRequestDefaultValuesInner {
  const MentionableSelectComponentForModalRequestDefaultValuesInnerRoleSelectDefaultValue(
    this.value,
  );

  final RoleSelectDefaultValue value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MentionableSelectComponentForModalRequestDefaultValuesInnerRoleSelectDefaultValue &&
        value == other.value;
  }
}

@immutable
final class MentionableSelectComponentForModalRequestDefaultValuesInnerUserSelectDefaultValue
    extends MentionableSelectComponentForModalRequestDefaultValuesInner {
  const MentionableSelectComponentForModalRequestDefaultValuesInnerUserSelectDefaultValue(
    this.value,
  );

  final UserSelectDefaultValue value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MentionableSelectComponentForModalRequestDefaultValuesInnerUserSelectDefaultValue &&
        value == other.value;
  }
}
