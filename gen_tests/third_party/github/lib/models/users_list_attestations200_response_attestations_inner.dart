// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/users_list_attestations200_response_attestations_inner_bundle.dart';
import 'package:meta/meta.dart';

@immutable
class UsersListAttestations200ResponseAttestationsInner {
  const UsersListAttestations200ResponseAttestationsInner({
    this.bundle,
    this.repositoryId,
    this.bundleUrl,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersListAttestations200ResponseAttestationsInner].
  factory UsersListAttestations200ResponseAttestationsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersListAttestations200ResponseAttestationsInner',
      json,
      () => UsersListAttestations200ResponseAttestationsInner(
        bundle:
            UsersListAttestations200ResponseAttestationsInnerBundle.maybeFromJson(
              json['bundle'] as Map<String, dynamic>?,
            ),
        repositoryId: json['repository_id'] as int?,
        bundleUrl: json['bundle_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersListAttestations200ResponseAttestationsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersListAttestations200ResponseAttestationsInner.fromJson(json);
  }

  /// The attestation's Sigstore Bundle.
  /// Refer to the [Sigstore Bundle
  /// Specification](https://github.com/sigstore/protobuf-specs/blob/main/protos/sigstore_bundle.proto)
  /// for more information.
  final UsersListAttestations200ResponseAttestationsInnerBundle? bundle;
  final int? repositoryId;
  final String? bundleUrl;

  /// Converts a [UsersListAttestations200ResponseAttestationsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (bundle != null) 'bundle': bundle?.toJson(),
      if (repositoryId != null) 'repository_id': repositoryId,
      if (bundleUrl != null) 'bundle_url': bundleUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([bundle, repositoryId, bundleUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersListAttestations200ResponseAttestationsInner &&
        bundle == other.bundle &&
        repositoryId == other.repositoryId &&
        bundleUrl == other.bundleUrl;
  }
}
