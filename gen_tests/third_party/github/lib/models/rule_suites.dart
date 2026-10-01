// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
