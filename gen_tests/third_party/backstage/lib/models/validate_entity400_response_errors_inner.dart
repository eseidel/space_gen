// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ValidateEntity400ResponseErrorsInner {
  const ValidateEntity400ResponseErrorsInner({
    required this.name,
    required this.message,
    required this.entries,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ValidateEntity400ResponseErrorsInner].
  factory ValidateEntity400ResponseErrorsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ValidateEntity400ResponseErrorsInner',
      json,
      () => ValidateEntity400ResponseErrorsInner(
        name: json['name'] as String,
        message: json['message'] as String,
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {'name', 'message'}.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ValidateEntity400ResponseErrorsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ValidateEntity400ResponseErrorsInner.fromJson(json);
  }

  final String name;
  final String message;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'name' => name,
    'message' => message,
    _ => entries[key],
  };

  /// Converts a [ValidateEntity400ResponseErrorsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
      for (final entry in entries.entries)
        if (!const {'name', 'message'}.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([name, message, mapHash(entries)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidateEntity400ResponseErrorsInner &&
        name == other.name &&
        message == other.message &&
        mapsEqual(entries, other.entries);
  }
}
