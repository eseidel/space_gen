// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCreateOrUpdateRepoSecretRequest {
  const ActionsCreateOrUpdateRepoSecretRequest({
    required this.encryptedValue,
    required this.keyId,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsCreateOrUpdateRepoSecretRequest].
  factory ActionsCreateOrUpdateRepoSecretRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsCreateOrUpdateRepoSecretRequest',
      json,
      () => ActionsCreateOrUpdateRepoSecretRequest(
        encryptedValue: json['encrypted_value'] as String,
        keyId: json['key_id'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCreateOrUpdateRepoSecretRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateOrUpdateRepoSecretRequest.fromJson(json);
  }

  /// Value for your secret, encrypted with
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages)
  /// using the public key retrieved from the [Get a repository public
  /// key](https://docs.github.com/rest/actions/secrets#get-a-repository-public-key)
  /// endpoint.
  final String encryptedValue;

  /// ID of the key you used to encrypt the secret.
  final String keyId;

  /// Converts an [ActionsCreateOrUpdateRepoSecretRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'encrypted_value': encryptedValue, 'key_id': keyId};
  }

  @override
  int get hashCode => Object.hashAll([encryptedValue, keyId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateOrUpdateRepoSecretRequest &&
        encryptedValue == other.encryptedValue &&
        keyId == other.keyId;
  }
}
