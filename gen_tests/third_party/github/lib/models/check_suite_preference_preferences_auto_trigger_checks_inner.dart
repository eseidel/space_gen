// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CheckSuitePreferencePreferencesAutoTriggerChecksInner {
  const CheckSuitePreferencePreferencesAutoTriggerChecksInner({
    required this.appId,
    required this.setting,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CheckSuitePreferencePreferencesAutoTriggerChecksInner].
  factory CheckSuitePreferencePreferencesAutoTriggerChecksInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CheckSuitePreferencePreferencesAutoTriggerChecksInner',
      json,
      () => CheckSuitePreferencePreferencesAutoTriggerChecksInner(
        appId: json['app_id'] as int,
        setting: json['setting'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckSuitePreferencePreferencesAutoTriggerChecksInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CheckSuitePreferencePreferencesAutoTriggerChecksInner.fromJson(json);
  }

  final int appId;
  final bool setting;

  /// Converts a [CheckSuitePreferencePreferencesAutoTriggerChecksInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'app_id': appId, 'setting': setting};
  }

  @override
  int get hashCode => Object.hashAll([appId, setting]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckSuitePreferencePreferencesAutoTriggerChecksInner &&
        appId == other.appId &&
        setting == other.setting;
  }
}
