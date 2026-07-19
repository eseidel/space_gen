import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner {
  const ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner({
    required this.appId,
    this.setting = true,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner].
  factory ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner',
      json,
      () => ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner(
        appId: json['app_id'] as int,
        setting: json['setting'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner.fromJson(
      json,
    );
  }

  /// The `id` of the GitHub App.
  final int appId;

  /// Set to `true` to enable automatic creation of CheckSuite events upon
  /// pushes to the repository, or `false` to disable them.
  final bool setting;

  /// Converts a [ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'app_id': appId, 'setting': setting};
  }

  @override
  int get hashCode => Object.hashAll([appId, setting]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner &&
        appId == other.appId &&
        setting == other.setting;
  }
}
