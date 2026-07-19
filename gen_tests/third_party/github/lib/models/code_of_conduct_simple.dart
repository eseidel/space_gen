import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template code_of_conduct_simple}
/// Code Of Conduct Simple
/// Code of Conduct Simple
/// {@endtemplate}
@immutable
class CodeOfConductSimple {
  /// {@macro code_of_conduct_simple}
  const CodeOfConductSimple({
    required this.url,
    required this.key,
    required this.name,
    required this.htmlUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeOfConductSimple].
  factory CodeOfConductSimple.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeOfConductSimple',
      json,
      () => CodeOfConductSimple(
        url: Uri.parse(json['url'] as String),
        key: json['key'] as String,
        name: json['name'] as String,
        htmlUrl: maybeParseUri(checkedKey(json, 'html_url') as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeOfConductSimple? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeOfConductSimple.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/github/docs/community/code_of_conduct'`
  final Uri url;

  /// Example: `'citizen_code_of_conduct'`
  final String key;

  /// Example: `'Citizen Code of Conduct'`
  final String name;

  /// Example: `'https://github.com/github/docs/blob/main/CODE_OF_CONDUCT.md'`
  final Uri? htmlUrl;

  /// Converts a [CodeOfConductSimple] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'key': key,
      'name': name,
      'html_url': htmlUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([url, key, name, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeOfConductSimple &&
        url == other.url &&
        key == other.key &&
        name == other.name &&
        htmlUrl == other.htmlUrl;
  }
}
