import 'package:github/model_helpers.dart';
import 'package:github/models/simple_classroom_organization.dart';
import 'package:meta/meta.dart';

/// {@template classroom}
/// Classroom
/// A GitHub Classroom classroom
/// {@endtemplate}
@immutable
class Classroom {
  /// {@macro classroom}
  const Classroom({
    required this.id,
    required this.name,
    required this.archived,
    required this.organization,
    required this.url,
  });

  /// Converts a `Map<String, dynamic>` to a [Classroom].
  factory Classroom.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Classroom',
      json,
      () => Classroom(
        id: json['id'] as int,
        name: json['name'] as String,
        archived: json['archived'] as bool,
        organization: SimpleClassroomOrganization.fromJson(
          json['organization'] as Map<String, dynamic>,
        ),
        url: json['url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Classroom? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Classroom.fromJson(json);
  }

  /// Unique identifier of the classroom.
  /// Example: `42`
  final int id;

  /// The name of the classroom.
  /// Example: `'Programming Elixir'`
  final String name;

  /// Whether classroom is archived.
  /// Example: `false`
  final bool archived;

  /// Organization Simple for Classroom
  /// A GitHub organization.
  final SimpleClassroomOrganization organization;

  /// The URL of the classroom on GitHub Classroom.
  /// Example:
  /// `'https://classroom.github.com/classrooms/1-programming-elixir'`
  final String url;

  /// Converts a [Classroom] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'archived': archived,
      'organization': organization.toJson(),
      'url': url,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, archived, organization, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Classroom &&
        id == other.id &&
        name == other.name &&
        archived == other.archived &&
        organization == other.organization &&
        url == other.url;
  }
}
