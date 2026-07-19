import 'package:github/model_helpers.dart';
import 'package:github/models/users_list_attestations200_response_attestations_inner.dart';
import 'package:meta/meta.dart';

@immutable
class UsersListAttestations200Response {
  const UsersListAttestations200Response({this.attestations});

  /// Converts a `Map<String, dynamic>` to a [UsersListAttestations200Response].
  factory UsersListAttestations200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UsersListAttestations200Response',
      json,
      () => UsersListAttestations200Response(
        attestations: (json['attestations'] as List?)
            ?.map<UsersListAttestations200ResponseAttestationsInner>(
              (e) => UsersListAttestations200ResponseAttestationsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersListAttestations200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersListAttestations200Response.fromJson(json);
  }

  final List<UsersListAttestations200ResponseAttestationsInner>? attestations;

  /// Converts a [UsersListAttestations200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (attestations != null)
        'attestations': attestations?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => listHash(attestations).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersListAttestations200Response &&
        listsEqual(attestations, other.attestations);
  }
}
