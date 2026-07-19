import 'package:github/model_helpers.dart';
import 'package:github/models/gist_history_change_status.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template gist_history}
/// Gist History
/// Gist History
/// {@endtemplate}
@immutable
class GistHistory {
  /// {@macro gist_history}
  const GistHistory({
    this.user,
    this.version,
    this.committedAt,
    this.changeStatus,
    this.url,
  });

  /// Converts a `Map<String, dynamic>` to a [GistHistory].
  factory GistHistory.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistHistory',
      json,
      () => GistHistory(
        user: SimpleUser.maybeFromJson(json['user'] as Map<String, dynamic>?),
        version: json['version'] as String?,
        committedAt: maybeParseDateTime(json['committed_at'] as String?),
        changeStatus: GistHistoryChangeStatus.maybeFromJson(
          json['change_status'] as Map<String, dynamic>?,
        ),
        url: maybeParseUri(json['url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistHistory? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistHistory.fromJson(json);
  }

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;
  final String? version;
  final DateTime? committedAt;
  final GistHistoryChangeStatus? changeStatus;
  final Uri? url;

  /// Converts a [GistHistory] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'version': version,
      'committed_at': committedAt?.toIso8601String(),
      'change_status': changeStatus?.toJson(),
      'url': url?.toString(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([user, version, committedAt, changeStatus, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistHistory &&
        user == other.user &&
        version == other.version &&
        committedAt == other.committedAt &&
        changeStatus == other.changeStatus &&
        url == other.url;
  }
}
