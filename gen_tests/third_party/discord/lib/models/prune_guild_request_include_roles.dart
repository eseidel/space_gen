// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class PruneGuildRequestIncludeRoles {
  const PruneGuildRequestIncludeRoles();

  factory PruneGuildRequestIncludeRoles.fromJson(dynamic json) {
    return switch (json) {
      final String v => PruneGuildRequestIncludeRolesString(v),
      final List<dynamic> v => PruneGuildRequestIncludeRolesList(
        v
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
      _ => throw FormatException(
        'Unsupported shape for PruneGuildRequestIncludeRoles: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PruneGuildRequestIncludeRoles? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return PruneGuildRequestIncludeRoles.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class PruneGuildRequestIncludeRolesString
    extends PruneGuildRequestIncludeRoles {
  const PruneGuildRequestIncludeRolesString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PruneGuildRequestIncludeRolesString && value == other.value;
  }
}

@immutable
final class PruneGuildRequestIncludeRolesList
    extends PruneGuildRequestIncludeRoles {
  const PruneGuildRequestIncludeRolesList(this.value);

  final List<SnowflakeType> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PruneGuildRequestIncludeRolesList && value == other.value;
  }
}
