// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:types/model_helpers.dart';

/// {@template widget}
/// Smoke-test object to exercise list/map fields through the generated
/// round-trip test — catches hashCode-vs-== drift on collections.
/// {@endtemplate}

class Widget {
  /// {@macro widget}
  Widget({
    required this.id,
    required this.attributes,
    this.tags = const [],
  });

  /// Converts a `Map<String, dynamic>` to a [Widget].
  factory Widget.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'Widget',
      json,
      () => Widget(
        id: json['id'] as int,
        tags: (json['tags'] as List).cast<String>(),
        attributes: (json['attributes'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, value as String),
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Widget? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Widget.fromJson(json);
  }

  int id;
  List<String> tags;
  Map<String, String> attributes;

  /// Converts a [Widget] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tags': tags,
      'attributes': attributes,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    listHash(tags),
    mapHash(attributes),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Widget &&
        id == other.id &&
        listsEqual(tags, other.tags) &&
        mapsEqual(attributes, other.attributes);
  }
}
