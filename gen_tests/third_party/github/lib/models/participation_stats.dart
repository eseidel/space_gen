import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template participation_stats}
/// Participation Stats
/// {@endtemplate}
@immutable
class ParticipationStats {
  /// {@macro participation_stats}
  const ParticipationStats({required this.all, required this.owner});

  /// Converts a `Map<String, dynamic>` to a [ParticipationStats].
  factory ParticipationStats.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ParticipationStats',
      json,
      () => ParticipationStats(
        all: (json['all'] as List).cast<int>(),
        owner: (json['owner'] as List).cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ParticipationStats? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ParticipationStats.fromJson(json);
  }

  final List<int> all;
  final List<int> owner;

  /// Converts a [ParticipationStats] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'all': all, 'owner': owner};
  }

  @override
  int get hashCode => Object.hashAll([listHash(all), listHash(owner)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ParticipationStats &&
        listsEqual(all, other.all) &&
        listsEqual(owner, other.owner);
  }
}
