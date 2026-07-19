// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/models/private_user.dart';
import 'package:github/models/public_user.dart';
import 'package:meta/meta.dart';

sealed class UsersGetAuthenticated200Response {
  const UsersGetAuthenticated200Response();

  factory UsersGetAuthenticated200Response.fromJson(Map<String, dynamic> json) {
    final discriminator = json['user_view_type'];
    return switch (discriminator) {
      'public' => UsersGetAuthenticated200ResponsePublicUser(
        PublicUser.fromJson(json),
      ),
      'private' => UsersGetAuthenticated200ResponsePrivateUser(
        PrivateUser.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown user_view_type '$discriminator' for UsersGetAuthenticated200Response",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersGetAuthenticated200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersGetAuthenticated200Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class UsersGetAuthenticated200ResponsePrivateUser
    extends UsersGetAuthenticated200Response {
  const UsersGetAuthenticated200ResponsePrivateUser(this.value);

  final PrivateUser value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersGetAuthenticated200ResponsePrivateUser &&
        value == other.value;
  }
}

@immutable
final class UsersGetAuthenticated200ResponsePublicUser
    extends UsersGetAuthenticated200Response {
  const UsersGetAuthenticated200ResponsePublicUser(this.value);

  final PublicUser value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersGetAuthenticated200ResponsePublicUser &&
        value == other.value;
  }
}
