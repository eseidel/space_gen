// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class GetCurrentUserApplicationEntitlementsParameter0 {
  const GetCurrentUserApplicationEntitlementsParameter0();

  factory GetCurrentUserApplicationEntitlementsParameter0.fromJson(
    dynamic json,
  ) {
    return switch (json) {
      final String v => GetCurrentUserApplicationEntitlementsParameter0String(
        v,
      ),
      final List<dynamic> v =>
        GetCurrentUserApplicationEntitlementsParameter0List(
          v
              .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
              .toList(),
        ),
      _ => throw FormatException(
        'Unsupported shape for GetCurrentUserApplicationEntitlementsParameter0: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetCurrentUserApplicationEntitlementsParameter0? maybeFromJson(
    dynamic json,
  ) {
    if (json == null) {
      return null;
    }
    return GetCurrentUserApplicationEntitlementsParameter0.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class GetCurrentUserApplicationEntitlementsParameter0String
    extends GetCurrentUserApplicationEntitlementsParameter0 {
  const GetCurrentUserApplicationEntitlementsParameter0String(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetCurrentUserApplicationEntitlementsParameter0String &&
        value == other.value;
  }
}

@immutable
final class GetCurrentUserApplicationEntitlementsParameter0List
    extends GetCurrentUserApplicationEntitlementsParameter0 {
  const GetCurrentUserApplicationEntitlementsParameter0List(this.value);

  final List<SnowflakeType> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetCurrentUserApplicationEntitlementsParameter0List &&
        value == other.value;
  }
}
