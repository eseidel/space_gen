import 'package:github/model_helpers.dart';
import 'package:github/models/code_scanning_alert_rule_security_severity_level.dart';
import 'package:github/models/code_scanning_alert_rule_severity.dart';
import 'package:meta/meta.dart';

@immutable
class CodeScanningAlertRule {
  const CodeScanningAlertRule({
    this.id,
    this.name,
    this.severity,
    this.securitySeverityLevel,
    this.description,
    this.fullDescription,
    this.tags,
    this.help,
    this.helpUri,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningAlertRule].
  factory CodeScanningAlertRule.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningAlertRule',
      json,
      () => CodeScanningAlertRule(
        id: json['id'] as String?,
        name: json['name'] as String?,
        severity: CodeScanningAlertRuleSeverity.maybeFromJson(
          json['severity'] as String?,
        ),
        securitySeverityLevel:
            CodeScanningAlertRuleSecuritySeverityLevel.maybeFromJson(
              json['security_severity_level'] as String?,
            ),
        description: json['description'] as String?,
        fullDescription: json['full_description'] as String?,
        tags: (json['tags'] as List?)?.cast<String>(),
        help: json['help'] as String?,
        helpUri: json['help_uri'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningAlertRule? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertRule.fromJson(json);
  }

  /// A unique identifier for the rule used to detect the alert.
  final String? id;

  /// The name of the rule used to detect the alert.
  final String? name;

  /// The severity of the alert.
  final CodeScanningAlertRuleSeverity? severity;

  /// The security severity of the alert.
  final CodeScanningAlertRuleSecuritySeverityLevel? securitySeverityLevel;

  /// A short description of the rule used to detect the alert.
  final String? description;

  /// A description of the rule used to detect the alert.
  final String? fullDescription;

  /// A set of tags applicable for the rule.
  final List<String>? tags;

  /// Detailed documentation for the rule as GitHub Flavored Markdown.
  final String? help;

  /// A link to the documentation for the rule used to detect the alert.
  final String? helpUri;

  /// Converts a [CodeScanningAlertRule] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (name != null) 'name': name,
      'severity': severity?.toJson(),
      'security_severity_level': securitySeverityLevel?.toJson(),
      if (description != null) 'description': description,
      if (fullDescription != null) 'full_description': fullDescription,
      'tags': tags,
      'help': help,
      'help_uri': helpUri,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    severity,
    securitySeverityLevel,
    description,
    fullDescription,
    listHash(tags),
    help,
    helpUri,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningAlertRule &&
        id == other.id &&
        name == other.name &&
        severity == other.severity &&
        securitySeverityLevel == other.securitySeverityLevel &&
        description == other.description &&
        fullDescription == other.fullDescription &&
        listsEqual(tags, other.tags) &&
        help == other.help &&
        helpUri == other.helpUri;
  }
}
