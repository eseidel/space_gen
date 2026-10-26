import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class ThreadSearchTag {
  const ThreadSearchTag();

  factory ThreadSearchTag.fromJson(dynamic json) {
    return switch (json) {
      final String v => ThreadSearchTagString(v),
      final List<dynamic> v => ThreadSearchTagList(
        v
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
      _ => throw FormatException(
        'Unsupported shape for ThreadSearchTag: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThreadSearchTag? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ThreadSearchTag.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ThreadSearchTagString extends ThreadSearchTag {
  const ThreadSearchTagString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadSearchTagString && value == other.value;
  }
}

@immutable
final class ThreadSearchTagList extends ThreadSearchTag {
  const ThreadSearchTagList(this.value);

  final List<SnowflakeType> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadSearchTagList && value == other.value;
  }
}
