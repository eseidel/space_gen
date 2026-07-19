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
