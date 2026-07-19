import 'package:meta/meta.dart';

sealed class WorkflowIdParam {
  const WorkflowIdParam();

  factory WorkflowIdParam.fromJson(dynamic json) {
    return switch (json) {
      final int v => WorkflowIdParamInt(v),
      final String v => WorkflowIdParamString(v),
      _ => throw FormatException(
        'Unsupported shape for WorkflowIdParam: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WorkflowIdParam? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return WorkflowIdParam.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class WorkflowIdParamInt extends WorkflowIdParam {
  const WorkflowIdParamInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowIdParamInt && value == other.value;
  }
}

@immutable
final class WorkflowIdParamString extends WorkflowIdParam {
  const WorkflowIdParamString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkflowIdParamString && value == other.value;
  }
}
