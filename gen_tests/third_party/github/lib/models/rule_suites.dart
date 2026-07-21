import 'package:github/models/rule_suites_inner.dart';

/// Rule Suites
/// Response
extension type const RuleSuites._(List<RuleSuitesInner> value)
    implements List<RuleSuitesInner> {
  const RuleSuites(this.value);

  factory RuleSuites.fromJson(List<dynamic> json) => RuleSuites(
    json
        .map<RuleSuitesInner>(
          (e) => RuleSuitesInner.fromJson(e as Map<String, dynamic>),
        )
        .toList(),
  );

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RuleSuites? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RuleSuites.fromJson(json);
  }

  List<dynamic> toJson() => value.map((e) => e.toJson()).toList();
}
