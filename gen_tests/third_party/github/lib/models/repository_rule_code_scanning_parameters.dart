import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_params_code_scanning_tool.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleCodeScanningParameters {
  const RepositoryRuleCodeScanningParameters({required this.codeScanningTools});

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleCodeScanningParameters].
  factory RepositoryRuleCodeScanningParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleCodeScanningParameters',
      json,
      () => RepositoryRuleCodeScanningParameters(
        codeScanningTools: (json['code_scanning_tools'] as List)
            .map<RepositoryRuleParamsCodeScanningTool>(
              (e) => RepositoryRuleParamsCodeScanningTool.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleCodeScanningParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCodeScanningParameters.fromJson(json);
  }

  /// Tools that must provide code scanning results for this rule to pass.
  final List<RepositoryRuleParamsCodeScanningTool> codeScanningTools;

  /// Converts a [RepositoryRuleCodeScanningParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'code_scanning_tools': codeScanningTools.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => listHash(codeScanningTools).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleCodeScanningParameters &&
        listsEqual(codeScanningTools, other.codeScanningTools);
  }
}
