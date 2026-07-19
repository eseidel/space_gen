import 'package:github/model_helpers.dart';
import 'package:github/models/gpg_key_subkeys_inner_emails_inner.dart';
import 'package:meta/meta.dart';

@immutable
class GpgKeySubkeysInner {
  const GpgKeySubkeysInner({
    this.id,
    this.primaryKeyId,
    this.keyId,
    this.publicKey,
    this.emails,
    this.subkeys,
    this.canSign,
    this.canEncryptComms,
    this.canEncryptStorage,
    this.canCertify,
    this.createdAt,
    this.expiresAt,
    this.rawKey,
    this.revoked,
  });

  /// Converts a `Map<String, dynamic>` to a [GpgKeySubkeysInner].
  factory GpgKeySubkeysInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GpgKeySubkeysInner',
      json,
      () => GpgKeySubkeysInner(
        id: json['id'] as int?,
        primaryKeyId: json['primary_key_id'] as int?,
        keyId: json['key_id'] as String?,
        publicKey: json['public_key'] as String?,
        emails: (json['emails'] as List?)
            ?.map<GpgKeySubkeysInnerEmailsInner>(
              (e) => GpgKeySubkeysInnerEmailsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        subkeys: (json['subkeys'] as List?)?.cast<dynamic>(),
        canSign: json['can_sign'] as bool?,
        canEncryptComms: json['can_encrypt_comms'] as bool?,
        canEncryptStorage: json['can_encrypt_storage'] as bool?,
        canCertify: json['can_certify'] as bool?,
        createdAt: json['created_at'] as String?,
        expiresAt: json['expires_at'] as String?,
        rawKey: json['raw_key'] as String?,
        revoked: json['revoked'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GpgKeySubkeysInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GpgKeySubkeysInner.fromJson(json);
  }

  final int? id;
  final int? primaryKeyId;
  final String? keyId;
  final String? publicKey;
  final List<GpgKeySubkeysInnerEmailsInner>? emails;
  final List<dynamic>? subkeys;
  final bool? canSign;
  final bool? canEncryptComms;
  final bool? canEncryptStorage;
  final bool? canCertify;
  final String? createdAt;
  final String? expiresAt;
  final String? rawKey;
  final bool? revoked;

  /// Converts a [GpgKeySubkeysInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (primaryKeyId != null) 'primary_key_id': primaryKeyId,
      if (keyId != null) 'key_id': keyId,
      if (publicKey != null) 'public_key': publicKey,
      if (emails != null) 'emails': emails?.map((e) => e.toJson()).toList(),
      if (subkeys != null) 'subkeys': subkeys,
      if (canSign != null) 'can_sign': canSign,
      if (canEncryptComms != null) 'can_encrypt_comms': canEncryptComms,
      if (canEncryptStorage != null) 'can_encrypt_storage': canEncryptStorage,
      if (canCertify != null) 'can_certify': canCertify,
      if (createdAt != null) 'created_at': createdAt,
      'expires_at': expiresAt,
      'raw_key': rawKey,
      if (revoked != null) 'revoked': revoked,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
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
    rawKey,
    revoked,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GpgKeySubkeysInner &&
        id == other.id &&
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
        rawKey == other.rawKey &&
        revoked == other.revoked;
  }
}
