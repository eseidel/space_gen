import 'package:discord/model_helpers.dart';
import 'package:discord/models/embedded_activity_instance_location.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class EmbeddedActivityInstance {
  const EmbeddedActivityInstance({
    required this.applicationId,
    required this.instanceId,
    required this.launchId,
    required this.location,
    required this.users,
  });

  /// Converts a `Map<String, dynamic>` to an [EmbeddedActivityInstance].
  factory EmbeddedActivityInstance.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EmbeddedActivityInstance',
      json,
      () => EmbeddedActivityInstance(
        applicationId: SnowflakeType.fromJson(json['application_id'] as String),
        instanceId: json['instance_id'] as String,
        launchId: json['launch_id'] as String,
        location: EmbeddedActivityInstanceLocation.fromJson(
          json['location'] as Map<String, dynamic>,
        ),
        users: (json['users'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EmbeddedActivityInstance? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EmbeddedActivityInstance.fromJson(json);
  }

  final SnowflakeType applicationId;
  final String instanceId;
  final String launchId;
  final EmbeddedActivityInstanceLocation location;
  final List<SnowflakeType> users;

  /// Converts an [EmbeddedActivityInstance] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'application_id': applicationId.toJson(),
      'instance_id': instanceId,
      'launch_id': launchId,
      'location': location.toJson(),
      'users': users.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    applicationId,
    instanceId,
    launchId,
    location,
    listHash(users),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EmbeddedActivityInstance &&
        applicationId == other.applicationId &&
        instanceId == other.instanceId &&
        launchId == other.launchId &&
        location == other.location &&
        listsEqual(users, other.users);
  }
}
