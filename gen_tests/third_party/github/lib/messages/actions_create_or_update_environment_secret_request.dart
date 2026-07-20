// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCreateOrUpdateEnvironmentSecretRequest {
  ActionsCreateOrUpdateEnvironmentSecretRequest({
    required this.encryptedValue,
    required this.keyId,
  }) {
    encryptedValue.validate(
      pattern:
          r'^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{4})$',
    );
  }

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsCreateOrUpdateEnvironmentSecretRequest].
  factory ActionsCreateOrUpdateEnvironmentSecretRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsCreateOrUpdateEnvironmentSecretRequest',
      json,
      () => ActionsCreateOrUpdateEnvironmentSecretRequest(
        encryptedValue: json['encrypted_value'] as String,
        keyId: json['key_id'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCreateOrUpdateEnvironmentSecretRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateOrUpdateEnvironmentSecretRequest.fromJson(json);
  }

  /// Value for your secret, encrypted with
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages)
  /// using the public key retrieved from the [Get an environment public
  /// key](https://docs.github.com/rest/actions/secrets#get-an-environment-public-key)
  /// endpoint.
  final String encryptedValue;

  /// ID of the key you used to encrypt the secret.
  final String keyId;

  /// Converts an [ActionsCreateOrUpdateEnvironmentSecretRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'encrypted_value': encryptedValue, 'key_id': keyId};
  }

  @override
  int get hashCode => Object.hashAll([encryptedValue, keyId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateOrUpdateEnvironmentSecretRequest &&
        encryptedValue == other.encryptedValue &&
        keyId == other.keyId;
  }
}
