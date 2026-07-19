import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class ConnectedAccountGuildResponse {
  const ConnectedAccountGuildResponse({
    required this.id,
    required this.name,
    required this.icon,
  });

  /// Converts a `Map<String, dynamic>` to a [ConnectedAccountGuildResponse].
  factory ConnectedAccountGuildResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ConnectedAccountGuildResponse',
      json,
      () => ConnectedAccountGuildResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        icon: checkedKey(json, 'icon') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ConnectedAccountGuildResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ConnectedAccountGuildResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String? icon;

  /// Converts a [ConnectedAccountGuildResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id.toJson(), 'name': name, 'icon': icon};
  }

  @override
  int get hashCode => Object.hashAll([id, name, icon]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConnectedAccountGuildResponse &&
        id == other.id &&
        name == other.name &&
        icon == other.icon;
  }
}
