import 'package:discord/model_helpers.dart';
import 'package:discord/models/thread_auto_archive_duration.dart';
import 'package:meta/meta.dart';

@immutable
class ThreadMetadataResponse {
  const ThreadMetadataResponse({
    required this.archived,
    required this.archiveTimestamp,
    required this.autoArchiveDuration,
    required this.locked,
    this.createTimestamp,
    this.invitable,
  });

  /// Converts a `Map<String, dynamic>` to a [ThreadMetadataResponse].
  factory ThreadMetadataResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ThreadMetadataResponse',
      json,
      () => ThreadMetadataResponse(
        archived: json['archived'] as bool,
        archiveTimestamp: maybeParseDateTime(
          checkedKey(json, 'archive_timestamp') as String?,
        ),
        autoArchiveDuration: ThreadAutoArchiveDuration.fromJson(
          json['auto_archive_duration'] as int,
        ),
        locked: json['locked'] as bool,
        createTimestamp: maybeParseDateTime(
          json['create_timestamp'] as String?,
        ),
        invitable: json['invitable'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThreadMetadataResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ThreadMetadataResponse.fromJson(json);
  }

  final bool archived;
  final DateTime? archiveTimestamp;
  final ThreadAutoArchiveDuration autoArchiveDuration;
  final bool locked;
  final DateTime? createTimestamp;
  final bool? invitable;

  /// Converts a [ThreadMetadataResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'archived': archived,
      'archive_timestamp': archiveTimestamp?.toIso8601String(),
      'auto_archive_duration': autoArchiveDuration.toJson(),
      'locked': locked,
      'create_timestamp': ?createTimestamp?.toIso8601String(),
      'invitable': ?invitable,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    archived,
    archiveTimestamp,
    autoArchiveDuration,
    locked,
    createTimestamp,
    invitable,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThreadMetadataResponse &&
        archived == other.archived &&
        archiveTimestamp == other.archiveTimestamp &&
        autoArchiveDuration == other.autoArchiveDuration &&
        locked == other.locked &&
        createTimestamp == other.createTimestamp &&
        invitable == other.invitable;
  }
}
