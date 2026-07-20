import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_permission.dart';
import 'package:meta/meta.dart';

@immutable
class SetGuildApplicationCommandPermissionsRequest {
  SetGuildApplicationCommandPermissionsRequest({this.permissions}) {
    permissions?.validate(maxItems: 100);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [SetGuildApplicationCommandPermissionsRequest].
  factory SetGuildApplicationCommandPermissionsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SetGuildApplicationCommandPermissionsRequest',
      json,
      () => SetGuildApplicationCommandPermissionsRequest(
        permissions: (json['permissions'] as List?)
            ?.map<ApplicationCommandPermission>(
              (e) => ApplicationCommandPermission.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SetGuildApplicationCommandPermissionsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SetGuildApplicationCommandPermissionsRequest.fromJson(json);
  }

  final List<ApplicationCommandPermission>? permissions;

  /// Converts a [SetGuildApplicationCommandPermissionsRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'permissions': permissions?.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(permissions).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SetGuildApplicationCommandPermissionsRequest &&
        listsEqual(permissions, other.permissions);
  }
}
