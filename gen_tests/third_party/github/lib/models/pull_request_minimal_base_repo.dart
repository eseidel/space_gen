import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestMinimalBaseRepo {
  const PullRequestMinimalBaseRepo({
    required this.id,
    required this.url,
    required this.name,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestMinimalBaseRepo].
  factory PullRequestMinimalBaseRepo.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestMinimalBaseRepo',
      json,
      () => PullRequestMinimalBaseRepo(
        id: json['id'] as int,
        url: json['url'] as String,
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestMinimalBaseRepo? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestMinimalBaseRepo.fromJson(json);
  }

  final int id;
  final String url;
  final String name;

  /// Converts a [PullRequestMinimalBaseRepo] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([id, url, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestMinimalBaseRepo &&
        id == other.id &&
        url == other.url &&
        name == other.name;
  }
}
