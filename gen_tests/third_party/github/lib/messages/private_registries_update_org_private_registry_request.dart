// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/private_registries_update_org_private_registry_request_registry_type.dart';
import 'package:github/models/private_registries_update_org_private_registry_request_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class PrivateRegistriesUpdateOrgPrivateRegistryRequest {
  const PrivateRegistriesUpdateOrgPrivateRegistryRequest({
    this.registryType,
    this.username,
    this.encryptedValue,
    this.keyId,
    this.visibility,
    this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [PrivateRegistriesUpdateOrgPrivateRegistryRequest].
  factory PrivateRegistriesUpdateOrgPrivateRegistryRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PrivateRegistriesUpdateOrgPrivateRegistryRequest',
      json,
      () => PrivateRegistriesUpdateOrgPrivateRegistryRequest(
        registryType:
            PrivateRegistriesUpdateOrgPrivateRegistryRequestRegistryType.maybeFromJson(
              json['registry_type'] as String?,
            ),
        username: json['username'] as String?,
        encryptedValue: json['encrypted_value'] as String?,
        keyId: json['key_id'] as String?,
        visibility:
            PrivateRegistriesUpdateOrgPrivateRegistryRequestVisibility.maybeFromJson(
              json['visibility'] as String?,
            ),
        selectedRepositoryIds: (json['selected_repository_ids'] as List?)
            ?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PrivateRegistriesUpdateOrgPrivateRegistryRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PrivateRegistriesUpdateOrgPrivateRegistryRequest.fromJson(json);
  }

  /// The registry type.
  final PrivateRegistriesUpdateOrgPrivateRegistryRequestRegistryType?
  registryType;

  /// The username to use when authenticating with the private registry. This
  /// field should be omitted if the private registry does not require a
  /// username for authentication.
  final String? username;

  /// The value for your secret, encrypted with
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages)
  /// using the public key retrieved from the [Get private registries public
  /// key for an
  /// organization](https://docs.github.com/rest/private-registries/organization-configurations#get-private-registries-public-key-for-an-organization)
  /// endpoint.
  final String? encryptedValue;

  /// The ID of the key you used to encrypt the secret.
  final String? keyId;

  /// Which type of organization repositories have access to the private
  /// registry. `selected` means only the repositories specified by
  /// `selected_repository_ids` can access the private registry.
  final PrivateRegistriesUpdateOrgPrivateRegistryRequestVisibility? visibility;

  /// An array of repository IDs that can access the organization private
  /// registry. You can only provide a list of repository IDs when
  /// `visibility` is set to `selected`. This field should be omitted if
  /// `visibility` is set to `all` or `private`.
  final List<int>? selectedRepositoryIds;

  /// Converts a [PrivateRegistriesUpdateOrgPrivateRegistryRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'registry_type': registryType?.toJson(),
      'username': username,
      'encrypted_value': encryptedValue,
      'key_id': keyId,
      'visibility': visibility?.toJson(),
      'selected_repository_ids': selectedRepositoryIds,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    registryType,
    username,
    encryptedValue,
    keyId,
    visibility,
    listHash(selectedRepositoryIds),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrivateRegistriesUpdateOrgPrivateRegistryRequest &&
        registryType == other.registryType &&
        username == other.username &&
        encryptedValue == other.encryptedValue &&
        keyId == other.keyId &&
        visibility == other.visibility &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}
