import 'package:github/model_helpers.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template stargazer}
/// Stargazer
/// Stargazer
/// {@endtemplate}
@immutable
class Stargazer {
  /// {@macro stargazer}
  const Stargazer({required this.starredAt, required this.user});

  /// Converts a `Map<String, dynamic>` to a [Stargazer].
  factory Stargazer.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Stargazer',
      json,
      () => Stargazer(
        starredAt: DateTime.parse(json['starred_at'] as String),
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Stargazer? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Stargazer.fromJson(json);
  }

  final DateTime starredAt;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;

  /// Converts a [Stargazer] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'starred_at': starredAt.toIso8601String(), 'user': user?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([starredAt, user]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Stargazer &&
        starredAt == other.starredAt &&
        user == other.user;
  }
}
