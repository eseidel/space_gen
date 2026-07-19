import 'package:github/model_helpers.dart';
import 'package:github/models/runner.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsRunnerJitconfigResponse {
  const ActionsRunnerJitconfigResponse({
    required this.runner,
    required this.encodedJitConfig,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsRunnerJitconfigResponse].
  factory ActionsRunnerJitconfigResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsRunnerJitconfigResponse',
      json,
      () => ActionsRunnerJitconfigResponse(
        runner: Runner.fromJson(json['runner'] as Map<String, dynamic>),
        encodedJitConfig: json['encoded_jit_config'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsRunnerJitconfigResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsRunnerJitconfigResponse.fromJson(json);
  }

  /// Self hosted runners
  /// A self hosted runner
  final Runner runner;

  /// The base64 encoded runner configuration.
  final String encodedJitConfig;

  /// Converts an [ActionsRunnerJitconfigResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'runner': runner.toJson(), 'encoded_jit_config': encodedJitConfig};
  }

  @override
  int get hashCode => Object.hashAll([runner, encodedJitConfig]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsRunnerJitconfigResponse &&
        runner == other.runner &&
        encodedJitConfig == other.encodedJitConfig;
  }
}
