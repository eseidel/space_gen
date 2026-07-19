import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template actions_set_custom_oidc_sub_claim_for_repo_request}
/// Actions OIDC subject customization for a repository
/// Actions OIDC subject customization for a repository
/// {@endtemplate}
@immutable
class ActionsSetCustomOidcSubClaimForRepoRequest {
  /// {@macro actions_set_custom_oidc_sub_claim_for_repo_request}
  const ActionsSetCustomOidcSubClaimForRepoRequest({
    required this.useDefault,
    this.includeClaimKeys,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsSetCustomOidcSubClaimForRepoRequest].
  factory ActionsSetCustomOidcSubClaimForRepoRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsSetCustomOidcSubClaimForRepoRequest',
      json,
      () => ActionsSetCustomOidcSubClaimForRepoRequest(
        useDefault: json['use_default'] as bool,
        includeClaimKeys: (json['include_claim_keys'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSetCustomOidcSubClaimForRepoRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsSetCustomOidcSubClaimForRepoRequest.fromJson(json);
  }

  /// Whether to use the default template or not. If `true`, the
  /// `include_claim_keys` field is ignored.
  final bool useDefault;

  /// Array of unique strings. Each claim key can only contain alphanumeric
  /// characters and underscores.
  final List<String>? includeClaimKeys;

  /// Converts an [ActionsSetCustomOidcSubClaimForRepoRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'use_default': useDefault,
      if (includeClaimKeys != null) 'include_claim_keys': includeClaimKeys,
    };
  }

  @override
  int get hashCode => Object.hashAll([useDefault, listHash(includeClaimKeys)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsSetCustomOidcSubClaimForRepoRequest &&
        useDefault == other.useDefault &&
        listsEqual(includeClaimKeys, other.includeClaimKeys);
  }
}
