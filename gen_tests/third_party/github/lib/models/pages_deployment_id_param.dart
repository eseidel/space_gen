// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';

sealed class PagesDeploymentIdParam {
  const PagesDeploymentIdParam();

  factory PagesDeploymentIdParam.fromJson(dynamic json) {
    return switch (json) {
      final int v => PagesDeploymentIdParamInt(v),
      final String v => PagesDeploymentIdParamString(v),
      _ => throw FormatException(
        'Unsupported shape for PagesDeploymentIdParam: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PagesDeploymentIdParam? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return PagesDeploymentIdParam.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class PagesDeploymentIdParamInt extends PagesDeploymentIdParam {
  const PagesDeploymentIdParamInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PagesDeploymentIdParamInt && value == other.value;
  }
}

@immutable
final class PagesDeploymentIdParamString extends PagesDeploymentIdParam {
  const PagesDeploymentIdParamString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PagesDeploymentIdParamString && value == other.value;
  }
}
