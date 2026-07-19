// Spec descriptions copy prose verbatim into dartdoc, where `<x>`
// is parsed as an HTML tag start even when it is not HTML (e.g.
// placeholder tokens like `<sha1hex>`).
// Suppress file-locally so the lint stays live elsewhere; spec
// authors do not always escape angle brackets.
// ignore_for_file: unintended_html_in_doc_comment
import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template location}
/// Entity location for a specific entity.
/// {@endtemplate}
@immutable
class Location {
  /// {@macro location}
  const Location({
    required this.target,
    required this.type,
    required this.id,
    required this.entityRef,
  });

  /// Converts a `Map<String, dynamic>` to a [Location].
  factory Location.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Location',
      json,
      () => Location(
        target: json['target'] as String,
        type: json['type'] as String,
        id: json['id'] as String,
        entityRef: json['entityRef'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Location? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Location.fromJson(json);
  }

  final String target;
  final String type;
  final String id;

  /// The entity ref of the corresponding Location kind entity, e.g.
  /// location:default/generated-<sha1hex>.
  final String entityRef;

  /// Converts a [Location] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'target': target, 'type': type, 'id': id, 'entityRef': entityRef};
  }

  @override
  int get hashCode => Object.hashAll([target, type, id, entityRef]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Location &&
        target == other.target &&
        type == other.type &&
        id == other.id &&
        entityRef == other.entityRef;
  }
}
