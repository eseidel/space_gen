import 'package:github/model_helpers.dart';
import 'package:github/models/check_suite_preference_preferences.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:meta/meta.dart';

/// {@template check_suite_preference}
/// Check Suite Preference
/// Check suite configuration preferences for a repository.
/// {@endtemplate}
@immutable
class CheckSuitePreference {
  /// {@macro check_suite_preference}
  const CheckSuitePreference({
    required this.preferences,
    required this.repository,
  });

  /// Converts a `Map<String, dynamic>` to a [CheckSuitePreference].
  factory CheckSuitePreference.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CheckSuitePreference',
      json,
      () => CheckSuitePreference(
        preferences: CheckSuitePreferencePreferences.fromJson(
          json['preferences'] as Map<String, dynamic>,
        ),
        repository: MinimalRepository.fromJson(
          json['repository'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckSuitePreference? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CheckSuitePreference.fromJson(json);
  }

  final CheckSuitePreferencePreferences preferences;

  /// Minimal Repository
  /// Minimal Repository
  final MinimalRepository repository;

  /// Converts a [CheckSuitePreference] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'preferences': preferences.toJson(),
      'repository': repository.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([preferences, repository]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckSuitePreference &&
        preferences == other.preferences &&
        repository == other.repository;
  }
}
