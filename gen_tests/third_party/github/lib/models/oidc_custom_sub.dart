import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template oidc_custom_sub}
/// Actions OIDC Subject customization
/// Actions OIDC Subject customization
/// {@endtemplate}
@immutable
class OidcCustomSub {
  /// {@macro oidc_custom_sub}
  const OidcCustomSub({required this.includeClaimKeys});

  /// Converts a `Map<String, dynamic>` to an [OidcCustomSub].
  factory OidcCustomSub.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OidcCustomSub',
      json,
      () => OidcCustomSub(
        includeClaimKeys: (json['include_claim_keys'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OidcCustomSub? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OidcCustomSub.fromJson(json);
  }

  /// Array of unique strings. Each claim key can only contain alphanumeric
  /// characters and underscores.
  final List<String> includeClaimKeys;

  /// Converts an [OidcCustomSub] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'include_claim_keys': includeClaimKeys};
  }

  @override
  int get hashCode => listHash(includeClaimKeys).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OidcCustomSub &&
        listsEqual(includeClaimKeys, other.includeClaimKeys);
  }
}
