import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template porter_author}
/// Porter Author
/// Porter Author
/// {@endtemplate}
@immutable
class PorterAuthor {
  /// {@macro porter_author}
  const PorterAuthor({
    required this.id,
    required this.remoteId,
    required this.remoteName,
    required this.email,
    required this.name,
    required this.url,
    required this.importUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [PorterAuthor].
  factory PorterAuthor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PorterAuthor',
      json,
      () => PorterAuthor(
        id: json['id'] as int,
        remoteId: json['remote_id'] as String,
        remoteName: json['remote_name'] as String,
        email: json['email'] as String,
        name: json['name'] as String,
        url: Uri.parse(json['url'] as String),
        importUrl: Uri.parse(json['import_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PorterAuthor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PorterAuthor.fromJson(json);
  }

  final int id;
  final String remoteId;
  final String remoteName;
  final String email;
  final String name;
  final Uri url;
  final Uri importUrl;

  /// Converts a [PorterAuthor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'remote_id': remoteId,
      'remote_name': remoteName,
      'email': email,
      'name': name,
      'url': url.toString(),
      'import_url': importUrl.toString(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, remoteId, remoteName, email, name, url, importUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PorterAuthor &&
        id == other.id &&
        remoteId == other.remoteId &&
        remoteName == other.remoteName &&
        email == other.email &&
        name == other.name &&
        url == other.url &&
        importUrl == other.importUrl;
  }
}
