// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/messages/role_select_default_value_response.dart';
import 'package:discord/messages/user_select_default_value_response.dart';
import 'package:meta/meta.dart';

sealed class MentionableSelectComponentResponseDefaultValuesInner {
  const MentionableSelectComponentResponseDefaultValuesInner();

  factory MentionableSelectComponentResponseDefaultValuesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      'role' =>
        MentionableSelectComponentResponseDefaultValuesInnerRoleSelectDefaultValueResponse(
          RoleSelectDefaultValueResponse.fromJson(json),
        ),
      'user' =>
        MentionableSelectComponentResponseDefaultValuesInnerUserSelectDefaultValueResponse(
          UserSelectDefaultValueResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MentionableSelectComponentResponseDefaultValuesInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionableSelectComponentResponseDefaultValuesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MentionableSelectComponentResponseDefaultValuesInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MentionableSelectComponentResponseDefaultValuesInnerRoleSelectDefaultValueResponse
    extends MentionableSelectComponentResponseDefaultValuesInner {
  const MentionableSelectComponentResponseDefaultValuesInnerRoleSelectDefaultValueResponse(
    this.value,
  );

  final RoleSelectDefaultValueResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MentionableSelectComponentResponseDefaultValuesInnerRoleSelectDefaultValueResponse &&
        value == other.value;
  }
}

@immutable
final class MentionableSelectComponentResponseDefaultValuesInnerUserSelectDefaultValueResponse
    extends MentionableSelectComponentResponseDefaultValuesInner {
  const MentionableSelectComponentResponseDefaultValuesInnerUserSelectDefaultValueResponse(
    this.value,
  );

  final UserSelectDefaultValueResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MentionableSelectComponentResponseDefaultValuesInnerUserSelectDefaultValueResponse &&
        value == other.value;
  }
}
