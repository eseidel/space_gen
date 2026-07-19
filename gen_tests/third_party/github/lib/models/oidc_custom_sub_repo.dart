import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template oidc_custom_sub_repo}
/// Actions OIDC subject customization for a repository
/// Actions OIDC subject customization for a repository
/// {@endtemplate}
@immutable
class OidcCustomSubRepo {
  /// {@macro oidc_custom_sub_repo}
  const OidcCustomSubRepo({required this.useDefault, this.includeClaimKeys});

  /// Converts a `Map<String, dynamic>` to an [OidcCustomSubRepo].
  factory OidcCustomSubRepo.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OidcCustomSubRepo',
      json,
      () => OidcCustomSubRepo(
        useDefault: json['use_default'] as bool,
        includeClaimKeys: (json['include_claim_keys'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OidcCustomSubRepo? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OidcCustomSubRepo.fromJson(json);
  }

  /// Whether to use the default template or not. If `true`, the
  /// `include_claim_keys` field is ignored.
  final bool useDefault;

  /// Array of unique strings. Each claim key can only contain alphanumeric
  /// characters and underscores.
  final List<String>? includeClaimKeys;

  /// Converts an [OidcCustomSubRepo] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'use_default': useDefault, 'include_claim_keys': includeClaimKeys};
  }

  @override
  int get hashCode => Object.hashAll([useDefault, listHash(includeClaimKeys)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OidcCustomSubRepo &&
        useDefault == other.useDefault &&
        listsEqual(includeClaimKeys, other.includeClaimKeys);
  }
}
