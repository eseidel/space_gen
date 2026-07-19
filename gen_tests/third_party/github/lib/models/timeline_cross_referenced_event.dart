import 'package:github/model_helpers.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/timeline_cross_referenced_event_source.dart';
import 'package:meta/meta.dart';

/// {@template timeline_cross_referenced_event}
/// Timeline Cross Referenced Event
/// Timeline Cross Referenced Event
/// {@endtemplate}
@immutable
class TimelineCrossReferencedEvent {
  /// {@macro timeline_cross_referenced_event}
  const TimelineCrossReferencedEvent({
    required this.event,
    required this.createdAt,
    required this.updatedAt,
    required this.source,
    this.actor,
  });

  /// Converts a `Map<String, dynamic>` to a [TimelineCrossReferencedEvent].
  factory TimelineCrossReferencedEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TimelineCrossReferencedEvent',
      json,
      () => TimelineCrossReferencedEvent(
        event: json['event'] as String,
        actor: SimpleUser.maybeFromJson(json['actor'] as Map<String, dynamic>?),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        source: TimelineCrossReferencedEventSource.fromJson(
          json['source'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineCrossReferencedEvent? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TimelineCrossReferencedEvent.fromJson(json);
  }

  final String event;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? actor;
  final DateTime createdAt;
  final DateTime updatedAt;
  final TimelineCrossReferencedEventSource source;

  /// Converts a [TimelineCrossReferencedEvent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'actor': ?actor?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'source': source.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([event, actor, createdAt, updatedAt, source]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineCrossReferencedEvent &&
        event == other.event &&
        actor == other.actor &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        source == other.source;
  }
}
