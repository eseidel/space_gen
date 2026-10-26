// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class PreviewPruneGuildIncludeRoles {
  const PreviewPruneGuildIncludeRoles();

  factory PreviewPruneGuildIncludeRoles.fromJson(dynamic json) {
    return switch (json) {
      final String v => PreviewPruneGuildIncludeRolesString(v),
      final List<dynamic> v => PreviewPruneGuildIncludeRolesList(
        v
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
      _ => throw FormatException(
        'Unsupported shape for PreviewPruneGuildIncludeRoles: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PreviewPruneGuildIncludeRoles? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return PreviewPruneGuildIncludeRoles.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class PreviewPruneGuildIncludeRolesString
    extends PreviewPruneGuildIncludeRoles {
  const PreviewPruneGuildIncludeRolesString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PreviewPruneGuildIncludeRolesString && value == other.value;
  }
}

@immutable
final class PreviewPruneGuildIncludeRolesList
    extends PreviewPruneGuildIncludeRoles {
  const PreviewPruneGuildIncludeRolesList(this.value);

  final List<SnowflakeType> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PreviewPruneGuildIncludeRolesList && value == other.value;
  }
}
