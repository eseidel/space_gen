import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class GetEntitlementsParameter1 {
  const GetEntitlementsParameter1();

  factory GetEntitlementsParameter1.fromJson(dynamic json) {
    return switch (json) {
      final String v => GetEntitlementsParameter1String(v),
      final List<dynamic> v => GetEntitlementsParameter1List(
        v
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
      _ => throw FormatException(
        'Unsupported shape for GetEntitlementsParameter1: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetEntitlementsParameter1? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return GetEntitlementsParameter1.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class GetEntitlementsParameter1String extends GetEntitlementsParameter1 {
  const GetEntitlementsParameter1String(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetEntitlementsParameter1String && value == other.value;
  }
}

@immutable
final class GetEntitlementsParameter1List extends GetEntitlementsParameter1 {
  const GetEntitlementsParameter1List(this.value);

  final List<SnowflakeType> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetEntitlementsParameter1List && value == other.value;
  }
}
