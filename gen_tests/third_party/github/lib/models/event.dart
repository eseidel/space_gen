import 'package:github/model_helpers.dart';
import 'package:github/models/actor.dart';
import 'package:github/models/event_payload.dart';
import 'package:github/models/event_repo.dart';
import 'package:meta/meta.dart';

/// {@template event}
/// Event
/// Event
/// {@endtemplate}
@immutable
class Event {
  /// {@macro event}
  const Event({
    required this.id,
    required this.type,
    required this.actor,
    required this.repo,
    required this.payload,
    required this.public,
    required this.createdAt,
    this.org,
  });

  /// Converts a `Map<String, dynamic>` to an [Event].
  factory Event.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Event',
      json,
      () => Event(
        id: json['id'] as String,
        type: checkedKey(json, 'type') as String?,
        actor: Actor.fromJson(json['actor'] as Map<String, dynamic>),
        repo: EventRepo.fromJson(json['repo'] as Map<String, dynamic>),
        org: Actor.maybeFromJson(json['org'] as Map<String, dynamic>?),
        payload: EventPayload.fromJson(json['payload'] as Map<String, dynamic>),
        public: json['public'] as bool,
        createdAt: maybeParseDateTime(
          checkedKey(json, 'created_at') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Event? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Event.fromJson(json);
  }

  final String id;
  final String? type;

  /// Actor
  /// Actor
  final Actor actor;
  final EventRepo repo;

  /// Actor
  /// Actor
  final Actor? org;
  final EventPayload payload;
  final bool public;
  final DateTime? createdAt;

  /// Converts an [Event] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'actor': actor.toJson(),
      'repo': repo.toJson(),
      'org': ?org?.toJson(),
      'payload': payload.toJson(),
      'public': public,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, type, actor, repo, org, payload, public, createdAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Event &&
        id == other.id &&
        type == other.type &&
        actor == other.actor &&
        repo == other.repo &&
        org == other.org &&
        payload == other.payload &&
        public == other.public &&
        createdAt == other.createdAt;
  }
}
