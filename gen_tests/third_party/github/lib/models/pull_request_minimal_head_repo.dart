// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestMinimalHeadRepo {
  const PullRequestMinimalHeadRepo({
    required this.id,
    required this.url,
    required this.name,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestMinimalHeadRepo].
  factory PullRequestMinimalHeadRepo.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestMinimalHeadRepo',
      json,
      () => PullRequestMinimalHeadRepo(
        id: json['id'] as int,
        url: json['url'] as String,
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestMinimalHeadRepo? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestMinimalHeadRepo.fromJson(json);
  }

  final int id;
  final String url;
  final String name;

  /// Converts a [PullRequestMinimalHeadRepo] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([id, url, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestMinimalHeadRepo &&
        id == other.id &&
        url == other.url &&
        name == other.name;
  }
}
