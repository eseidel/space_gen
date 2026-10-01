// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
