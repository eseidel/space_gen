import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsBillingUsageMinutesUsedBreakdown {
  const ActionsBillingUsageMinutesUsedBreakdown({
    this.ubuntu,
    this.macos,
    this.windows,
    this.ubuntu4Core,
    this.ubuntu8Core,
    this.ubuntu16Core,
    this.ubuntu32Core,
    this.ubuntu64Core,
    this.windows4Core,
    this.windows8Core,
    this.windows16Core,
    this.windows32Core,
    this.windows64Core,
    this.macos12Core,
    this.total,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsBillingUsageMinutesUsedBreakdown].
  factory ActionsBillingUsageMinutesUsedBreakdown.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsBillingUsageMinutesUsedBreakdown',
      json,
      () => ActionsBillingUsageMinutesUsedBreakdown(
        ubuntu: json['UBUNTU'] as int?,
        macos: json['MACOS'] as int?,
        windows: json['WINDOWS'] as int?,
        ubuntu4Core: json['ubuntu_4_core'] as int?,
        ubuntu8Core: json['ubuntu_8_core'] as int?,
        ubuntu16Core: json['ubuntu_16_core'] as int?,
        ubuntu32Core: json['ubuntu_32_core'] as int?,
        ubuntu64Core: json['ubuntu_64_core'] as int?,
        windows4Core: json['windows_4_core'] as int?,
        windows8Core: json['windows_8_core'] as int?,
        windows16Core: json['windows_16_core'] as int?,
        windows32Core: json['windows_32_core'] as int?,
        windows64Core: json['windows_64_core'] as int?,
        macos12Core: json['macos_12_core'] as int?,
        total: json['total'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsBillingUsageMinutesUsedBreakdown? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsBillingUsageMinutesUsedBreakdown.fromJson(json);
  }

  /// Total minutes used on Ubuntu runner machines.
  final int? ubuntu;

  /// Total minutes used on macOS runner machines.
  final int? macos;

  /// Total minutes used on Windows runner machines.
  final int? windows;

  /// Total minutes used on Ubuntu 4 core runner machines.
  final int? ubuntu4Core;

  /// Total minutes used on Ubuntu 8 core runner machines.
  final int? ubuntu8Core;

  /// Total minutes used on Ubuntu 16 core runner machines.
  final int? ubuntu16Core;

  /// Total minutes used on Ubuntu 32 core runner machines.
  final int? ubuntu32Core;

  /// Total minutes used on Ubuntu 64 core runner machines.
  final int? ubuntu64Core;

  /// Total minutes used on Windows 4 core runner machines.
  final int? windows4Core;

  /// Total minutes used on Windows 8 core runner machines.
  final int? windows8Core;

  /// Total minutes used on Windows 16 core runner machines.
  final int? windows16Core;

  /// Total minutes used on Windows 32 core runner machines.
  final int? windows32Core;

  /// Total minutes used on Windows 64 core runner machines.
  final int? windows64Core;

  /// Total minutes used on macOS 12 core runner machines.
  final int? macos12Core;

  /// Total minutes used on all runner machines.
  final int? total;

  /// Converts an [ActionsBillingUsageMinutesUsedBreakdown]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (ubuntu != null) 'UBUNTU': ubuntu,
      if (macos != null) 'MACOS': macos,
      if (windows != null) 'WINDOWS': windows,
      if (ubuntu4Core != null) 'ubuntu_4_core': ubuntu4Core,
      if (ubuntu8Core != null) 'ubuntu_8_core': ubuntu8Core,
      if (ubuntu16Core != null) 'ubuntu_16_core': ubuntu16Core,
      if (ubuntu32Core != null) 'ubuntu_32_core': ubuntu32Core,
      if (ubuntu64Core != null) 'ubuntu_64_core': ubuntu64Core,
      if (windows4Core != null) 'windows_4_core': windows4Core,
      if (windows8Core != null) 'windows_8_core': windows8Core,
      if (windows16Core != null) 'windows_16_core': windows16Core,
      if (windows32Core != null) 'windows_32_core': windows32Core,
      if (windows64Core != null) 'windows_64_core': windows64Core,
      if (macos12Core != null) 'macos_12_core': macos12Core,
      if (total != null) 'total': total,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    ubuntu,
    macos,
    windows,
    ubuntu4Core,
    ubuntu8Core,
    ubuntu16Core,
    ubuntu32Core,
    ubuntu64Core,
    windows4Core,
    windows8Core,
    windows16Core,
    windows32Core,
    windows64Core,
    macos12Core,
    total,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsBillingUsageMinutesUsedBreakdown &&
        ubuntu == other.ubuntu &&
        macos == other.macos &&
        windows == other.windows &&
        ubuntu4Core == other.ubuntu4Core &&
        ubuntu8Core == other.ubuntu8Core &&
        ubuntu16Core == other.ubuntu16Core &&
        ubuntu32Core == other.ubuntu32Core &&
        ubuntu64Core == other.ubuntu64Core &&
        windows4Core == other.windows4Core &&
        windows8Core == other.windows8Core &&
        windows16Core == other.windows16Core &&
        windows32Core == other.windows32Core &&
        windows64Core == other.windows64Core &&
        macos12Core == other.macos12Core &&
        total == other.total;
  }
}
