import 'package:github/model_helpers.dart';
import 'package:github/models/pull_request_minimal_base.dart';
import 'package:github/models/pull_request_minimal_head.dart';
import 'package:meta/meta.dart';

/// {@template pull_request_minimal}
/// Pull Request Minimal
/// {@endtemplate}
@immutable
class PullRequestMinimal {
  /// {@macro pull_request_minimal}
  const PullRequestMinimal({
    required this.id,
    required this.number,
    required this.url,
    required this.head,
    required this.base,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestMinimal].
  factory PullRequestMinimal.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestMinimal',
      json,
      () => PullRequestMinimal(
        id: json['id'] as int,
        number: json['number'] as int,
        url: json['url'] as String,
        head: PullRequestMinimalHead.fromJson(
          json['head'] as Map<String, dynamic>,
        ),
        base: PullRequestMinimalBase.fromJson(
          json['base'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestMinimal? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullRequestMinimal.fromJson(json);
  }

  final int id;
  final int number;
  final String url;
  final PullRequestMinimalHead head;
  final PullRequestMinimalBase base;

  /// Converts a [PullRequestMinimal] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'url': url,
      'head': head.toJson(),
      'base': base.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, number, url, head, base]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestMinimal &&
        id == other.id &&
        number == other.number &&
        url == other.url &&
        head == other.head &&
        base == other.base;
  }
}
