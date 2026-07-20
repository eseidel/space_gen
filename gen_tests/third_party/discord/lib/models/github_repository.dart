import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GithubRepository {
  GithubRepository({
    required this.id,
    required this.htmlUrl,
    required this.name,
    required this.fullName,
  }) {
    name.validate(maxLength: 152133);
    fullName.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubRepository].
  factory GithubRepository.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubRepository',
      json,
      () => GithubRepository(
        id: json['id'] as int,
        htmlUrl: Uri.parse(json['html_url'] as String),
        name: json['name'] as String,
        fullName: json['full_name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubRepository? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubRepository.fromJson(json);
  }

  final int id;
  final Uri htmlUrl;
  final String name;
  final String fullName;

  /// Converts a [GithubRepository] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'html_url': htmlUrl.toString(),
      'name': name,
      'full_name': fullName,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, htmlUrl, name, fullName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubRepository &&
        id == other.id &&
        htmlUrl == other.htmlUrl &&
        name == other.name &&
        fullName == other.fullName;
  }
}
