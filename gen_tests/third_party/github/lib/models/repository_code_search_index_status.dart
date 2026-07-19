import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template repository_code_search_index_status}
/// The status of the code search index for this repository
/// {@endtemplate}
@immutable
class RepositoryCodeSearchIndexStatus {
  /// {@macro repository_code_search_index_status}
  const RepositoryCodeSearchIndexStatus({
    this.lexicalSearchOk,
    this.lexicalCommitSha,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryCodeSearchIndexStatus].
  factory RepositoryCodeSearchIndexStatus.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryCodeSearchIndexStatus',
      json,
      () => RepositoryCodeSearchIndexStatus(
        lexicalSearchOk: json['lexical_search_ok'] as bool?,
        lexicalCommitSha: json['lexical_commit_sha'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryCodeSearchIndexStatus? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryCodeSearchIndexStatus.fromJson(json);
  }

  final bool? lexicalSearchOk;
  final String? lexicalCommitSha;

  /// Converts a [RepositoryCodeSearchIndexStatus] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'lexical_search_ok': lexicalSearchOk,
      'lexical_commit_sha': lexicalCommitSha,
    };
  }

  @override
  int get hashCode => Object.hashAll([lexicalSearchOk, lexicalCommitSha]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryCodeSearchIndexStatus &&
        lexicalSearchOk == other.lexicalSearchOk &&
        lexicalCommitSha == other.lexicalCommitSha;
  }
}
