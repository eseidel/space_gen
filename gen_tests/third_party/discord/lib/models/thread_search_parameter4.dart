import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class ThreadSearchParameter4 {
  const ThreadSearchParameter4();

  factory ThreadSearchParameter4.fromJson(dynamic json) {
    return switch (json) {
      final String v => ThreadSearchParameter4String(v),
      final List<dynamic> v => ThreadSearchParameter4List(
        v
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
      _ => throw FormatException(
        'Unsupported shape for ThreadSearchParameter4: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThreadSearchParameter4? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ThreadSearchParameter4.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ThreadSearchParameter4String extends ThreadSearchParameter4 {
  const ThreadSearchParameter4String(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadSearchParameter4String && value == other.value;
  }
}

@immutable
final class ThreadSearchParameter4List extends ThreadSearchParameter4 {
  const ThreadSearchParameter4List(this.value);

  final List<SnowflakeType> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadSearchParameter4List && value == other.value;
  }
}
