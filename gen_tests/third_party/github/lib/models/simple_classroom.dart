import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template simple_classroom}
/// Simple Classroom
/// A GitHub Classroom classroom
/// {@endtemplate}
@immutable
class SimpleClassroom {
  /// {@macro simple_classroom}
  const SimpleClassroom({
    required this.id,
    required this.name,
    required this.archived,
    required this.url,
  });

  /// Converts a `Map<String, dynamic>` to a [SimpleClassroom].
  factory SimpleClassroom.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SimpleClassroom',
      json,
      () => SimpleClassroom(
        id: json['id'] as int,
        name: json['name'] as String,
        archived: json['archived'] as bool,
        url: json['url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SimpleClassroom? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SimpleClassroom.fromJson(json);
  }

  /// Unique identifier of the classroom.
  /// Example: `42`
  final int id;

  /// The name of the classroom.
  /// Example: `'Programming Elixir'`
  final String name;

  /// Returns whether classroom is archived or not.
  /// Example: `false`
  final bool archived;

  /// The url of the classroom on GitHub Classroom.
  /// Example:
  /// `'https://classroom.github.com/classrooms/1-programming-elixir'`
  final String url;

  /// Converts a [SimpleClassroom] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'archived': archived, 'url': url};
  }

  @override
  int get hashCode => Object.hashAll([id, name, archived, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleClassroom &&
        id == other.id &&
        name == other.name &&
        archived == other.archived &&
        url == other.url;
  }
}
