import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template check_automated_security_fixes}
/// Check Dependabot security updates
/// Check Dependabot security updates
/// {@endtemplate}
@immutable
class CheckAutomatedSecurityFixes {
  /// {@macro check_automated_security_fixes}
  const CheckAutomatedSecurityFixes({
    required this.enabled,
    required this.paused,
  });

  /// Converts a `Map<String, dynamic>` to a [CheckAutomatedSecurityFixes].
  factory CheckAutomatedSecurityFixes.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CheckAutomatedSecurityFixes',
      json,
      () => CheckAutomatedSecurityFixes(
        enabled: json['enabled'] as bool,
        paused: json['paused'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckAutomatedSecurityFixes? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CheckAutomatedSecurityFixes.fromJson(json);
  }

  /// Whether Dependabot security updates are enabled for the repository.
  /// Example: `true`
  final bool enabled;

  /// Whether Dependabot security updates are paused for the repository.
  /// Example: `false`
  final bool paused;

  /// Converts a [CheckAutomatedSecurityFixes] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enabled': enabled, 'paused': paused};
  }

  @override
  int get hashCode => Object.hashAll([enabled, paused]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckAutomatedSecurityFixes &&
        enabled == other.enabled &&
        paused == other.paused;
  }
}
