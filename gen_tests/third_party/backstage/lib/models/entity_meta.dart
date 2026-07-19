// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/entity_link.dart';
import 'package:meta/meta.dart';

/// {@template entity_meta}
/// Metadata fields common to all versions/kinds of entity.
/// {@endtemplate}
@immutable
class EntityMeta {
  /// {@macro entity_meta}
  const EntityMeta({
    required this.name,
    required this.entries,
    this.links,
    this.tags,
    this.annotations,
    this.labels,
    this.description,
    this.title,
    this.namespace,
    this.etag,
    this.uid,
  });

  /// Converts a `Map<String, dynamic>` to an [EntityMeta].
  factory EntityMeta.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityMeta',
      json,
      () => EntityMeta(
        links: (json['links'] as List?)
            ?.map<EntityLink>(
              (e) => EntityLink.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        tags: (json['tags'] as List?)?.cast<String>(),
        annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        labels: (json['labels'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        description: json['description'] as String?,
        title: json['title'] as String?,
        namespace: json['namespace'] as String?,
        name: json['name'] as String,
        etag: json['etag'] as String?,
        uid: json['uid'] as String?,
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'links',
              'tags',
              'annotations',
              'labels',
              'description',
              'title',
              'namespace',
              'name',
              'etag',
              'uid',
            }.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityMeta? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityMeta.fromJson(json);
  }

  /// A list of external hyperlinks related to the entity.
  final List<EntityLink>? links;

  /// A list of single-valued strings, to for example classify catalog
  /// entities in
  /// various ways.
  final List<String>? tags;

  /// Construct a type with a set of properties K of type T
  final Map<String, String>? annotations;

  /// Construct a type with a set of properties K of type T
  final Map<String, String>? labels;

  /// A short (typically relatively few words, on one line) description of the
  /// entity.
  final String? description;

  /// A display name of the entity, to be presented in user interfaces instead
  /// of the `name` property above, when available.
  /// This field is sometimes useful when the `name` is cumbersome or ends up
  /// being perceived as overly technical. The title generally does not have
  /// as stringent format requirements on it, so it may contain special
  /// characters and be more explanatory. Do keep it very short though, and
  /// avoid situations where a title can be confused with the name of another
  /// entity, or where two entities share a title.
  /// Note that this is only for display purposes, and may be ignored by some
  /// parts of the code. Entity references still always make use of the `name`
  /// property, not the title.
  final String? title;

  /// The namespace that the entity belongs to.
  final String? namespace;

  /// The name of the entity.
  /// Must be unique within the catalog at any given point in time, for any
  /// given namespace + kind pair. This value is part of the technical
  /// identifier of the entity, and as such it will appear in URLs, database
  /// tables, entity references, and similar. It is subject to restrictions
  /// regarding what characters are allowed.
  /// If you want to use a different, more human readable string with fewer
  /// restrictions on it in user interfaces, see the `title` field below.
  final String name;

  /// An opaque string that changes for each update operation to any part of
  /// the entity, including metadata.
  /// This field can not be set by the user at creation time, and the server
  /// will reject an attempt to do so. The field will be populated in read
  /// operations. The field can (optionally) be specified when performing
  /// update or delete operations, and the server will then reject the
  /// operation if it does not match the current stored value.
  final String? etag;

  /// A globally unique ID for the entity.
  /// This field can not be set by the user at creation time, and the server
  /// will reject an attempt to do so. The field will be populated in read
  /// operations. The field can (optionally) be specified when performing
  /// update or delete operations, but the server is free to reject requests
  /// that do so in such a way that it breaks semantics.
  final String? uid;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'links' => links,
    'tags' => tags,
    'annotations' => annotations,
    'labels' => labels,
    'description' => description,
    'title' => title,
    'namespace' => namespace,
    'name' => name,
    'etag' => etag,
    'uid' => uid,
    _ => entries[key],
  };

  /// Converts an [EntityMeta] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'links': ?links?.map((e) => e.toJson()).toList(),
      'tags': ?tags,
      'annotations': ?annotations,
      'labels': ?labels,
      'description': ?description,
      'title': ?title,
      'namespace': ?namespace,
      'name': name,
      'etag': ?etag,
      'uid': ?uid,
      for (final entry in entries.entries)
        if (!const {
          'links',
          'tags',
          'annotations',
          'labels',
          'description',
          'title',
          'namespace',
          'name',
          'etag',
          'uid',
        }.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(links),
    listHash(tags),
    mapHash(annotations),
    mapHash(labels),
    description,
    title,
    namespace,
    name,
    etag,
    uid,
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityMeta &&
        listsEqual(links, other.links) &&
        listsEqual(tags, other.tags) &&
        mapsEqual(annotations, other.annotations) &&
        mapsEqual(labels, other.labels) &&
        description == other.description &&
        title == other.title &&
        namespace == other.namespace &&
        name == other.name &&
        etag == other.etag &&
        uid == other.uid &&
        mapsEqual(entries, other.entries);
  }
}
