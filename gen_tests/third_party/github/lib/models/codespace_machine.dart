import 'package:github/model_helpers.dart';
import 'package:github/models/codespace_machine_prebuild_availability.dart';
import 'package:meta/meta.dart';

/// {@template codespace_machine}
/// Codespace machine
/// A description of the machine powering a codespace.
/// {@endtemplate}
@immutable
class CodespaceMachine {
  /// {@macro codespace_machine}
  const CodespaceMachine({
    required this.name,
    required this.displayName,
    required this.operatingSystem,
    required this.storageInBytes,
    required this.memoryInBytes,
    required this.cpus,
    required this.prebuildAvailability,
  });

  /// Converts a `Map<String, dynamic>` to a [CodespaceMachine].
  factory CodespaceMachine.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodespaceMachine',
      json,
      () => CodespaceMachine(
        name: json['name'] as String,
        displayName: json['display_name'] as String,
        operatingSystem: json['operating_system'] as String,
        storageInBytes: json['storage_in_bytes'] as int,
        memoryInBytes: json['memory_in_bytes'] as int,
        cpus: json['cpus'] as int,
        prebuildAvailability:
            CodespaceMachinePrebuildAvailability.maybeFromJson(
              checkedKey(json, 'prebuild_availability') as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespaceMachine? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespaceMachine.fromJson(json);
  }

  /// The name of the machine.
  /// Example: `'standardLinux'`
  final String name;

  /// The display name of the machine includes cores, memory, and storage.
  /// Example: `'4 cores, 16 GB RAM, 64 GB storage'`
  final String displayName;

  /// The operating system of the machine.
  /// Example: `'linux'`
  final String operatingSystem;

  /// How much storage is available to the codespace.
  /// Example: `68719476736`
  final int storageInBytes;

  /// How much memory is available to the codespace.
  /// Example: `17179869184`
  final int memoryInBytes;

  /// How many cores are available to the codespace.
  /// Example: `4`
  final int cpus;

  /// Whether a prebuild is currently available when creating a codespace for
  /// this machine and repository. If a branch was not specified as a ref, the
  /// default branch will be assumed. Value will be "null" if prebuilds are
  /// not supported or prebuild availability could not be determined. Value
  /// will be "none" if no prebuild is available. Latest values "ready" and
  /// "in_progress" indicate the prebuild availability status.
  /// Example: `'ready'`
  final CodespaceMachinePrebuildAvailability? prebuildAvailability;

  /// Converts a [CodespaceMachine] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'display_name': displayName,
      'operating_system': operatingSystem,
      'storage_in_bytes': storageInBytes,
      'memory_in_bytes': memoryInBytes,
      'cpus': cpus,
      'prebuild_availability': prebuildAvailability?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    displayName,
    operatingSystem,
    storageInBytes,
    memoryInBytes,
    cpus,
    prebuildAvailability,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespaceMachine &&
        name == other.name &&
        displayName == other.displayName &&
        operatingSystem == other.operatingSystem &&
        storageInBytes == other.storageInBytes &&
        memoryInBytes == other.memoryInBytes &&
        cpus == other.cpus &&
        prebuildAvailability == other.prebuildAvailability;
  }
}
