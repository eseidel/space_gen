// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template gitignore_template}
/// Gitignore Template
/// Gitignore Template
/// {@endtemplate}
@immutable
class GitignoreTemplate {
  /// {@macro gitignore_template}
  const GitignoreTemplate({required this.name, required this.source});

  /// Converts a `Map<String, dynamic>` to a [GitignoreTemplate].
  factory GitignoreTemplate.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitignoreTemplate',
      json,
      () => GitignoreTemplate(
        name: json['name'] as String,
        source: json['source'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitignoreTemplate? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitignoreTemplate.fromJson(json);
  }

  /// Example: `'C'`
  final String name;

  /// Example: `'# Object files\n*.o\n\n# Libraries\n*.lib\n*.a\n\n# Shared objects (inc. Windows DLLs)\n*.dll\n*.so\n*.so.*\n*.dylib\n\n# Executables\n*.exe\n*.out\n*.app\n'`
  final String source;

  /// Converts a [GitignoreTemplate] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'source': source};
  }

  @override
  int get hashCode => Object.hashAll([name, source]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitignoreTemplate &&
        name == other.name &&
        source == other.source;
  }
}
