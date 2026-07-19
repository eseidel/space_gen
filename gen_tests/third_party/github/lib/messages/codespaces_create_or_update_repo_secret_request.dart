// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesCreateOrUpdateRepoSecretRequest {
  const CodespacesCreateOrUpdateRepoSecretRequest({
    this.encryptedValue,
    this.keyId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesCreateOrUpdateRepoSecretRequest].
  factory CodespacesCreateOrUpdateRepoSecretRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesCreateOrUpdateRepoSecretRequest',
      json,
      () => CodespacesCreateOrUpdateRepoSecretRequest(
        encryptedValue: json['encrypted_value'] as String?,
        keyId: json['key_id'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesCreateOrUpdateRepoSecretRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateOrUpdateRepoSecretRequest.fromJson(json);
  }

  /// Value for your secret, encrypted with
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages)
  /// using the public key retrieved from the [Get a repository public
  /// key](https://docs.github.com/rest/codespaces/repository-secrets#get-a-repository-public-key)
  /// endpoint.
  final String? encryptedValue;

  /// ID of the key you used to encrypt the secret.
  final String? keyId;

  /// Converts a [CodespacesCreateOrUpdateRepoSecretRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'encrypted_value': encryptedValue, 'key_id': keyId};
  }

  @override
  int get hashCode => Object.hashAll([encryptedValue, keyId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesCreateOrUpdateRepoSecretRequest &&
        encryptedValue == other.encryptedValue &&
        keyId == other.keyId;
  }
}
