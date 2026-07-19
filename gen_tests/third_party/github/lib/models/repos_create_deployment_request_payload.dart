// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

sealed class ReposCreateDeploymentRequestPayload {
  const ReposCreateDeploymentRequestPayload();

  factory ReposCreateDeploymentRequestPayload.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v => ReposCreateDeploymentRequestPayloadMap(v),
      final String v => ReposCreateDeploymentRequestPayloadString(v),
      _ => throw FormatException(
        'Unsupported shape for ReposCreateDeploymentRequestPayload: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateDeploymentRequestPayload? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ReposCreateDeploymentRequestPayload.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ReposCreateDeploymentRequestPayloadMap
    extends ReposCreateDeploymentRequestPayload {
  const ReposCreateDeploymentRequestPayloadMap(this.value);

  final Map<String, dynamic> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateDeploymentRequestPayloadMap &&
        value == other.value;
  }
}

@immutable
final class ReposCreateDeploymentRequestPayloadString
    extends ReposCreateDeploymentRequestPayload {
  const ReposCreateDeploymentRequestPayloadString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateDeploymentRequestPayloadString &&
        value == other.value;
  }
}
