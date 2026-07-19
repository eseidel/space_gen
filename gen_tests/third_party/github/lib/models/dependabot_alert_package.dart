import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template dependabot_alert_package}
/// Details for the vulnerable package.
/// {@endtemplate}
@immutable
class DependabotAlertPackage {
  /// {@macro dependabot_alert_package}
  const DependabotAlertPackage({required this.ecosystem, required this.name});

  /// Converts a `Map<String, dynamic>` to a [DependabotAlertPackage].
  factory DependabotAlertPackage.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DependabotAlertPackage',
      json,
      () => DependabotAlertPackage(
        ecosystem: json['ecosystem'] as String,
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotAlertPackage? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DependabotAlertPackage.fromJson(json);
  }

  /// The package's language or package management ecosystem.
  final String ecosystem;

  /// The unique package name within its ecosystem.
  final String name;

  /// Converts a [DependabotAlertPackage] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'ecosystem': ecosystem, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([ecosystem, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotAlertPackage &&
        ecosystem == other.ecosystem &&
        name == other.name;
  }
}
