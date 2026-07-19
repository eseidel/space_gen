import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_list_attestations200_response_attestations_inner.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsListAttestations200Response {
  const OrgsListAttestations200Response({this.attestations});

  /// Converts a `Map<String, dynamic>` to an [OrgsListAttestations200Response].
  factory OrgsListAttestations200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsListAttestations200Response',
      json,
      () => OrgsListAttestations200Response(
        attestations: (json['attestations'] as List?)
            ?.map<OrgsListAttestations200ResponseAttestationsInner>(
              (e) => OrgsListAttestations200ResponseAttestationsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsListAttestations200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsListAttestations200Response.fromJson(json);
  }

  final List<OrgsListAttestations200ResponseAttestationsInner>? attestations;

  /// Converts an [OrgsListAttestations200Response] to a `Map<String, dynamic>`.
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
    return other is OrgsListAttestations200Response &&
        listsEqual(attestations, other.attestations);
  }
}
