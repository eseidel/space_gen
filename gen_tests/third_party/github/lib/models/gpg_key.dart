import 'package:github/model_helpers.dart';
import 'package:github/models/gpg_key_emails_inner.dart';
import 'package:github/models/gpg_key_subkeys_inner.dart';
import 'package:meta/meta.dart';

/// {@template gpg_key}
/// GPG Key
/// A unique encryption key
/// {@endtemplate}
@immutable
class GpgKey {
  /// {@macro gpg_key}
  const GpgKey({
    required this.id,
    required this.primaryKeyId,
    required this.keyId,
    required this.publicKey,
    required this.emails,
    required this.subkeys,
    required this.canSign,
    required this.canEncryptComms,
    required this.canEncryptStorage,
    required this.canCertify,
    required this.createdAt,
    required this.expiresAt,
    required this.revoked,
    required this.rawKey,
    this.name,
  });

  /// Converts a `Map<String, dynamic>` to a [GpgKey].
  factory GpgKey.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GpgKey',
      json,
      () => GpgKey(
        id: json['id'] as int,
        name: json['name'] as String?,
        primaryKeyId: checkedKey(json, 'primary_key_id') as int?,
        keyId: json['key_id'] as String,
        publicKey: json['public_key'] as String,
        emails: (json['emails'] as List)
            .map<GpgKeyEmailsInner>(
              (e) => GpgKeyEmailsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        subkeys: (json['subkeys'] as List)
            .map<GpgKeySubkeysInner>(
              (e) => GpgKeySubkeysInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        canSign: json['can_sign'] as bool,
        canEncryptComms: json['can_encrypt_comms'] as bool,
        canEncryptStorage: json['can_encrypt_storage'] as bool,
        canCertify: json['can_certify'] as bool,
        createdAt: DateTime.parse(json['created_at'] as String),
        expiresAt: maybeParseDateTime(
          checkedKey(json, 'expires_at') as String?,
        ),
        revoked: json['revoked'] as bool,
        rawKey: checkedKey(json, 'raw_key') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GpgKey? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GpgKey.fromJson(json);
  }

  /// Example: `3`
  final int id;

  /// Example: `'Octocat\'s GPG Key'`
  final String? name;
  final int? primaryKeyId;

  /// Example: `'3262EFF25BA0D270'`
  final String keyId;

  /// Example: `'xsBNBFayYZ...'`
  final String publicKey;

  /// Example:
  /// ```json
  /// {
  ///   "email": "octocat@users.noreply.github.com",
  ///   "verified": true
  /// }
  /// ```
  final List<GpgKeyEmailsInner> emails;

  /// Example:
  /// ```json
  /// {
  ///   "id": 4,
  ///   "primary_key_id": 3,
  ///   "key_id": "4A595D4C72EE49C7",
  ///   "public_key": "zsBNBFayYZ...",
  ///   "emails": [],
  ///   "can_sign": false,
  ///   "can_encrypt_comms": true,
  ///   "can_encrypt_storage": true,
  ///   "can_certify": false,
  ///   "created_at": "2016-03-24T11:31:04-06:00",
  ///   "expires_at": null,
  ///   "revoked": false
  /// }
  /// ```
  final List<GpgKeySubkeysInner> subkeys;

  /// Example: `true`
  final bool canSign;
  final bool canEncryptComms;
  final bool canEncryptStorage;

  /// Example: `true`
  final bool canCertify;

  /// Example: `'2016-03-24T11:31:04-06:00'`
  final DateTime createdAt;
  final DateTime? expiresAt;

  /// Example: `true`
  final bool revoked;
  final String? rawKey;

  /// Converts a [GpgKey] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'primary_key_id': primaryKeyId,
      'key_id': keyId,
      'public_key': publicKey,
      'emails': emails.map((e) => e.toJson()).toList(),
      'subkeys': subkeys.map((e) => e.toJson()).toList(),
      'can_sign': canSign,
      'can_encrypt_comms': canEncryptComms,
      'can_encrypt_storage': canEncryptStorage,
      'can_certify': canCertify,
      'created_at': createdAt.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
      'revoked': revoked,
      'raw_key': rawKey,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    primaryKeyId,
    keyId,
    publicKey,
    listHash(emails),
    listHash(subkeys),
    canSign,
    canEncryptComms,
    canEncryptStorage,
    canCertify,
    createdAt,
    expiresAt,
    revoked,
    rawKey,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GpgKey &&
        id == other.id &&
        name == other.name &&
        primaryKeyId == other.primaryKeyId &&
        keyId == other.keyId &&
        publicKey == other.publicKey &&
        listsEqual(emails, other.emails) &&
        listsEqual(subkeys, other.subkeys) &&
        canSign == other.canSign &&
        canEncryptComms == other.canEncryptComms &&
        canEncryptStorage == other.canEncryptStorage &&
        canCertify == other.canCertify &&
        createdAt == other.createdAt &&
        expiresAt == other.expiresAt &&
        revoked == other.revoked &&
        rawKey == other.rawKey;
  }
}
