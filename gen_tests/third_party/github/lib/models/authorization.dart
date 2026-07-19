import 'package:github/model_helpers.dart';
import 'package:github/models/authorization_app.dart';
import 'package:github/models/scoped_installation.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template authorization}
/// Authorization
/// The authorization for an OAuth app, GitHub App, or a Personal Access Token.
/// {@endtemplate}
@immutable
class Authorization {
  /// {@macro authorization}
  const Authorization({
    required this.id,
    required this.url,
    required this.scopes,
    required this.token,
    required this.tokenLastEight,
    required this.hashedToken,
    required this.app,
    required this.note,
    required this.noteUrl,
    required this.updatedAt,
    required this.createdAt,
    required this.fingerprint,
    required this.expiresAt,
    this.user,
    this.installation,
  });

  /// Converts a `Map<String, dynamic>` to an [Authorization].
  factory Authorization.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Authorization',
      json,
      () => Authorization(
        id: json['id'] as int,
        url: Uri.parse(json['url'] as String),
        scopes: (checkedKey(json, 'scopes') as List?)?.cast<String>(),
        token: json['token'] as String,
        tokenLastEight: checkedKey(json, 'token_last_eight') as String?,
        hashedToken: checkedKey(json, 'hashed_token') as String?,
        app: AuthorizationApp.fromJson(json['app'] as Map<String, dynamic>),
        note: checkedKey(json, 'note') as String?,
        noteUrl: maybeParseUri(checkedKey(json, 'note_url') as String?),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        fingerprint: checkedKey(json, 'fingerprint') as String?,
        user: SimpleUser.maybeFromJson(json['user'] as Map<String, dynamic>?),
        installation: ScopedInstallation.maybeFromJson(
          json['installation'] as Map<String, dynamic>?,
        ),
        expiresAt: maybeParseDateTime(
          checkedKey(json, 'expires_at') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Authorization? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Authorization.fromJson(json);
  }

  final int id;
  final Uri url;

  /// A list of scopes that this authorization is in.
  final List<String>? scopes;
  final String token;
  final String? tokenLastEight;
  final String? hashedToken;
  final AuthorizationApp app;
  final String? note;
  final Uri? noteUrl;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String? fingerprint;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;

  /// Scoped Installation
  final ScopedInstallation? installation;
  final DateTime? expiresAt;

  /// Converts an [Authorization] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url.toString(),
      'scopes': scopes,
      'token': token,
      'token_last_eight': tokenLastEight,
      'hashed_token': hashedToken,
      'app': app.toJson(),
      'note': note,
      'note_url': noteUrl?.toString(),
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'fingerprint': fingerprint,
      'user': user?.toJson(),
      'installation': installation?.toJson(),
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    url,
    listHash(scopes),
    token,
    tokenLastEight,
    hashedToken,
    app,
    note,
    noteUrl,
    updatedAt,
    createdAt,
    fingerprint,
    user,
    installation,
    expiresAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Authorization &&
        id == other.id &&
        url == other.url &&
        listsEqual(scopes, other.scopes) &&
        token == other.token &&
        tokenLastEight == other.tokenLastEight &&
        hashedToken == other.hashedToken &&
        app == other.app &&
        note == other.note &&
        noteUrl == other.noteUrl &&
        updatedAt == other.updatedAt &&
        createdAt == other.createdAt &&
        fingerprint == other.fingerprint &&
        user == other.user &&
        installation == other.installation &&
        expiresAt == other.expiresAt;
  }
}
