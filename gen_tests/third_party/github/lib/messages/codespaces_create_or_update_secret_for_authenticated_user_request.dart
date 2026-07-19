// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_create_or_update_secret_for_authenticated_user_request_selected_repository_ids_inner.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest {
  const CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest({
    required this.keyId,
    this.encryptedValue,
    this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest].
  factory CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest',
      json,
      () => CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest(
        encryptedValue: json['encrypted_value'] as String?,
        keyId: json['key_id'] as String,
        selectedRepositoryIds: (json['selected_repository_ids'] as List?)
            ?.map<
              CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner
            >(
              (e) =>
                  CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest.fromJson(
      json,
    );
  }

  /// Value for your secret, encrypted with
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages)
  /// using the public key retrieved from the [Get the public key for the
  /// authenticated
  /// user](https://docs.github.com/rest/codespaces/secrets#get-public-key-for-the-authenticated-user)
  /// endpoint.
  final String? encryptedValue;

  /// ID of the key you used to encrypt the secret.
  final String keyId;

  /// An array of repository ids that can access the user secret. You can
  /// manage the list of selected repositories using the [List selected
  /// repositories for a user
  /// secret](https://docs.github.com/rest/codespaces/secrets#list-selected-repositories-for-a-user-secret),
  /// [Set selected repositories for a user
  /// secret](https://docs.github.com/rest/codespaces/secrets#set-selected-repositories-for-a-user-secret),
  /// and [Remove a selected repository from a user
  /// secret](https://docs.github.com/rest/codespaces/secrets#remove-a-selected-repository-from-a-user-secret)
  /// endpoints.
  final List<
    CodespacesCreateOrUpdateSecretForAuthenticatedUserRequestSelectedRepositoryIdsInner
  >?
  selectedRepositoryIds;

  /// Converts a [CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'encrypted_value': ?encryptedValue,
      'key_id': keyId,
      'selected_repository_ids': ?selectedRepositoryIds
          ?.map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([encryptedValue, keyId, listHash(selectedRepositoryIds)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest &&
        encryptedValue == other.encryptedValue &&
        keyId == other.keyId &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}
