// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/role_select_default_value.dart';
import 'package:discord/models/user_select_default_value.dart';
import 'package:meta/meta.dart';

sealed class MentionableSelectComponentForMessageRequestDefaultValuesInner {
  const MentionableSelectComponentForMessageRequestDefaultValuesInner();

  factory MentionableSelectComponentForMessageRequestDefaultValuesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      'role' =>
        MentionableSelectComponentForMessageRequestDefaultValuesInnerRoleSelectDefaultValue(
          RoleSelectDefaultValue.fromJson(json),
        ),
      'user' =>
        MentionableSelectComponentForMessageRequestDefaultValuesInnerUserSelectDefaultValue(
          UserSelectDefaultValue.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MentionableSelectComponentForMessageRequestDefaultValuesInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionableSelectComponentForMessageRequestDefaultValuesInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MentionableSelectComponentForMessageRequestDefaultValuesInner.fromJson(
      json,
    );
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MentionableSelectComponentForMessageRequestDefaultValuesInnerRoleSelectDefaultValue
    extends MentionableSelectComponentForMessageRequestDefaultValuesInner {
  const MentionableSelectComponentForMessageRequestDefaultValuesInnerRoleSelectDefaultValue(
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
            is MentionableSelectComponentForMessageRequestDefaultValuesInnerRoleSelectDefaultValue &&
        value == other.value;
  }
}

@immutable
final class MentionableSelectComponentForMessageRequestDefaultValuesInnerUserSelectDefaultValue
    extends MentionableSelectComponentForMessageRequestDefaultValuesInner {
  const MentionableSelectComponentForMessageRequestDefaultValuesInnerUserSelectDefaultValue(
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
            is MentionableSelectComponentForMessageRequestDefaultValuesInnerUserSelectDefaultValue &&
        value == other.value;
  }
}
