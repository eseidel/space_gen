// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/checks_set_suites_preferences_request_auto_trigger_checks_inner.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksSetSuitesPreferencesRequest {
  const ChecksSetSuitesPreferencesRequest({this.autoTriggerChecks});

  /// Converts a `Map<String, dynamic>` to a
  /// [ChecksSetSuitesPreferencesRequest].
  factory ChecksSetSuitesPreferencesRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChecksSetSuitesPreferencesRequest',
      json,
      () => ChecksSetSuitesPreferencesRequest(
        autoTriggerChecks: (json['auto_trigger_checks'] as List?)
            ?.map<ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner>(
              (e) =>
                  ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksSetSuitesPreferencesRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksSetSuitesPreferencesRequest.fromJson(json);
  }

  /// Enables or disables automatic creation of CheckSuite events upon pushes
  /// to the repository. Enabled by default.
  final List<ChecksSetSuitesPreferencesRequestAutoTriggerChecksInner>?
  autoTriggerChecks;

  /// Converts a [ChecksSetSuitesPreferencesRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'auto_trigger_checks': ?autoTriggerChecks
          ?.map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode => listHash(autoTriggerChecks).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksSetSuitesPreferencesRequest &&
        listsEqual(autoTriggerChecks, other.autoTriggerChecks);
  }
}
