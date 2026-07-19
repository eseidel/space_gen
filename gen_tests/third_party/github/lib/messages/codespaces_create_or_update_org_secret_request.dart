// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_create_or_update_org_secret_request_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesCreateOrUpdateOrgSecretRequest {
  const CodespacesCreateOrUpdateOrgSecretRequest({
    required this.visibility,
    this.encryptedValue,
    this.keyId,
    this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesCreateOrUpdateOrgSecretRequest].
  factory CodespacesCreateOrUpdateOrgSecretRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesCreateOrUpdateOrgSecretRequest',
      json,
      () => CodespacesCreateOrUpdateOrgSecretRequest(
        encryptedValue: json['encrypted_value'] as String?,
        keyId: json['key_id'] as String?,
        visibility: CodespacesCreateOrUpdateOrgSecretRequestVisibility.fromJson(
          json['visibility'] as String,
        ),
        selectedRepositoryIds: (json['selected_repository_ids'] as List?)
            ?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesCreateOrUpdateOrgSecretRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateOrUpdateOrgSecretRequest.fromJson(json);
  }

  /// The value for your secret, encrypted with
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages)
  /// using the public key retrieved from the [Get an organization public
  /// key](https://docs.github.com/rest/codespaces/organization-secrets#get-an-organization-public-key)
  /// endpoint.
  final String? encryptedValue;

  /// The ID of the key you used to encrypt the secret.
  final String? keyId;

  /// Which type of organization repositories have access to the organization
  /// secret. `selected` means only the repositories specified by
  /// `selected_repository_ids` can access the secret.
  final CodespacesCreateOrUpdateOrgSecretRequestVisibility visibility;

  /// An array of repository IDs that can access the organization secret. You
  /// can only provide a list of repository IDs when the `visibility` is set
  /// to `selected`. You can manage the list of selected repositories using
  /// the [List selected repositories for an organization
  /// secret](https://docs.github.com/rest/codespaces/organization-secrets#list-selected-repositories-for-an-organization-secret),
  /// [Set selected repositories for an organization
  /// secret](https://docs.github.com/rest/codespaces/organization-secrets#set-selected-repositories-for-an-organization-secret),
  /// and [Remove selected repository from an organization
  /// secret](https://docs.github.com/rest/codespaces/organization-secrets#remove-selected-repository-from-an-organization-secret)
  /// endpoints.
  final List<int>? selectedRepositoryIds;

  /// Converts a [CodespacesCreateOrUpdateOrgSecretRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (encryptedValue != null) 'encrypted_value': encryptedValue,
      if (keyId != null) 'key_id': keyId,
      'visibility': visibility.toJson(),
      if (selectedRepositoryIds != null)
        'selected_repository_ids': selectedRepositoryIds,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    encryptedValue,
    keyId,
    visibility,
    listHash(selectedRepositoryIds),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesCreateOrUpdateOrgSecretRequest &&
        encryptedValue == other.encryptedValue &&
        keyId == other.keyId &&
        visibility == other.visibility &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}
