import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

sealed class GetEntitlementsSkuIds {
  const GetEntitlementsSkuIds();

  factory GetEntitlementsSkuIds.fromJson(dynamic json) {
    return switch (json) {
      final String v => GetEntitlementsSkuIdsString(v),
      final List<dynamic> v => GetEntitlementsSkuIdsList(
        v
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
      _ => throw FormatException(
        'Unsupported shape for GetEntitlementsSkuIds: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetEntitlementsSkuIds? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return GetEntitlementsSkuIds.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class GetEntitlementsSkuIdsString extends GetEntitlementsSkuIds {
  const GetEntitlementsSkuIdsString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetEntitlementsSkuIdsString && value == other.value;
  }
}

@immutable
final class GetEntitlementsSkuIdsList extends GetEntitlementsSkuIds {
  const GetEntitlementsSkuIdsList(this.value);

  final List<SnowflakeType> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetEntitlementsSkuIdsList && value == other.value;
  }
}
