import 'package:meta/meta.dart';

sealed class DeploymentPayload {
  const DeploymentPayload();

  factory DeploymentPayload.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v => DeploymentPayloadMap(v),
      final String v => DeploymentPayloadString(v),
      _ => throw FormatException(
        'Unsupported shape for DeploymentPayload: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DeploymentPayload? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return DeploymentPayload.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class DeploymentPayloadMap extends DeploymentPayload {
  const DeploymentPayloadMap(this.value);

  final Map<String, dynamic> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeploymentPayloadMap && value == other.value;
  }
}

@immutable
final class DeploymentPayloadString extends DeploymentPayload {
  const DeploymentPayloadString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeploymentPayloadString && value == other.value;
  }
}
