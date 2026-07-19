import 'package:github/model_helpers.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_codeql_database}
/// CodeQL Database
/// A CodeQL database.
/// {@endtemplate}
@immutable
class CodeScanningCodeqlDatabase {
  /// {@macro code_scanning_codeql_database}
  const CodeScanningCodeqlDatabase({
    required this.id,
    required this.name,
    required this.language,
    required this.uploader,
    required this.contentType,
    required this.size,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
    this.commitOid,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeScanningCodeqlDatabase].
  factory CodeScanningCodeqlDatabase.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeScanningCodeqlDatabase',
      json,
      () => CodeScanningCodeqlDatabase(
        id: json['id'] as int,
        name: json['name'] as String,
        language: json['language'] as String,
        uploader: SimpleUser.fromJson(json['uploader'] as Map<String, dynamic>),
        contentType: json['content_type'] as String,
        size: json['size'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        url: Uri.parse(json['url'] as String),
        commitOid: json['commit_oid'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningCodeqlDatabase? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningCodeqlDatabase.fromJson(json);
  }

  /// The ID of the CodeQL database.
  final int id;

  /// The name of the CodeQL database.
  final String name;

  /// The language of the CodeQL database.
  final String language;

  /// Simple User
  /// A GitHub user.
  final SimpleUser uploader;

  /// The MIME type of the CodeQL database file.
  final String contentType;

  /// The size of the CodeQL database file in bytes.
  final int size;

  /// The date and time at which the CodeQL database was created, in ISO 8601
  /// format':' YYYY-MM-DDTHH:MM:SSZ.
  final DateTime createdAt;

  /// The date and time at which the CodeQL database was last updated, in ISO
  /// 8601 format':' YYYY-MM-DDTHH:MM:SSZ.
  final DateTime updatedAt;

  /// The URL at which to download the CodeQL database. The `Accept` header
  /// must be set to the value of the `content_type` property.
  final Uri url;

  /// The commit SHA of the repository at the time the CodeQL database was
  /// created.
  final String? commitOid;

  /// Converts a [CodeScanningCodeqlDatabase] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'language': language,
      'uploader': uploader.toJson(),
      'content_type': contentType,
      'size': size,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'url': url.toString(),
      'commit_oid': commitOid,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    language,
    uploader,
    contentType,
    size,
    createdAt,
    updatedAt,
    url,
    commitOid,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningCodeqlDatabase &&
        id == other.id &&
        name == other.name &&
        language == other.language &&
        uploader == other.uploader &&
        contentType == other.contentType &&
        size == other.size &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        url == other.url &&
        commitOid == other.commitOid;
  }
}
