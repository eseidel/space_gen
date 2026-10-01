// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
