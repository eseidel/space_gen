// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class PreviewPruneGuildParameter1 {
  const PreviewPruneGuildParameter1();

  factory PreviewPruneGuildParameter1.fromJson(dynamic json) {
    return switch (json) {
      final String v => PreviewPruneGuildParameter1String(v),
      final List<dynamic> v => PreviewPruneGuildParameter1List(
        v
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
      _ => throw FormatException(
        'Unsupported shape for PreviewPruneGuildParameter1: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PreviewPruneGuildParameter1? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return PreviewPruneGuildParameter1.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class PreviewPruneGuildParameter1String
    extends PreviewPruneGuildParameter1 {
  const PreviewPruneGuildParameter1String(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PreviewPruneGuildParameter1String && value == other.value;
  }
}

@immutable
final class PreviewPruneGuildParameter1List
    extends PreviewPruneGuildParameter1 {
  const PreviewPruneGuildParameter1List(this.value);

  final List<SnowflakeType> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PreviewPruneGuildParameter1List && value == other.value;
  }
}
