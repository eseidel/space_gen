import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template topic}
/// Topic
/// A topic aggregates entities that are related to a subject.
/// {@endtemplate}
@immutable
class Topic {
  /// {@macro topic}
  const Topic({required this.names});

  /// Converts a `Map<String, dynamic>` to a [Topic].
  factory Topic.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Topic',
      json,
      () => Topic(names: (json['names'] as List).cast<String>()),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Topic? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Topic.fromJson(json);
  }

  final List<String> names;

  /// Converts a [Topic] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'names': names};
  }

  @override
  int get hashCode => listHash(names).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Topic && listsEqual(names, other.names);
  }
}
