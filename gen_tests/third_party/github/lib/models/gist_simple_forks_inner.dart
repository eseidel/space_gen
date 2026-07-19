import 'package:github/model_helpers.dart';
import 'package:github/models/public_user.dart';
import 'package:meta/meta.dart';

@immutable
class GistSimpleForksInner {
  const GistSimpleForksInner({
    this.id,
    this.url,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [GistSimpleForksInner].
  factory GistSimpleForksInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistSimpleForksInner',
      json,
      () => GistSimpleForksInner(
        id: json['id'] as String?,
        url: maybeParseUri(json['url'] as String?),
        user: PublicUser.maybeFromJson(json['user'] as Map<String, dynamic>?),
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        updatedAt: maybeParseDateTime(json['updated_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistSimpleForksInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistSimpleForksInner.fromJson(json);
  }

  final String? id;
  final Uri? url;

  /// Public User
  /// Public User
  final PublicUser? user;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Converts a [GistSimpleForksInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url?.toString(),
      'user': user?.toJson(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, url, user, createdAt, updatedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistSimpleForksInner &&
        id == other.id &&
        url == other.url &&
        user == other.user &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
