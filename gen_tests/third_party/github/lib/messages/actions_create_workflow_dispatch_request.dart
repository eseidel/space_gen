import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCreateWorkflowDispatchRequest {
  const ActionsCreateWorkflowDispatchRequest({required this.ref, this.inputs});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsCreateWorkflowDispatchRequest].
  factory ActionsCreateWorkflowDispatchRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsCreateWorkflowDispatchRequest',
      json,
      () => ActionsCreateWorkflowDispatchRequest(
        ref: json['ref'] as String,
        inputs: json['inputs'] as Map<String, dynamic>?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCreateWorkflowDispatchRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateWorkflowDispatchRequest.fromJson(json);
  }

  /// The git reference for the workflow. The reference can be a branch or tag
  /// name.
  final String ref;

  /// Input keys and values configured in the workflow file. The maximum
  /// number of properties is 10. Any default properties configured in the
  /// workflow file will be used when `inputs` are omitted.
  final Map<String, dynamic>? inputs;

  /// Converts an [ActionsCreateWorkflowDispatchRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'ref': ref, if (inputs != null) 'inputs': inputs};
  }

  @override
  int get hashCode => Object.hashAll([ref, mapHash(inputs)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateWorkflowDispatchRequest &&
        ref == other.ref &&
        mapsEqual(inputs, other.inputs);
  }
}
