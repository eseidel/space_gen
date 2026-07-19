// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_list_attestations_bulk200_response_attestations_subject_digests_inner.dart';
import 'package:github/models/orgs_list_attestations_bulk200_response_page_info.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsListAttestationsBulk200Response {
  const OrgsListAttestationsBulk200Response({
    this.attestationsSubjectDigests,
    this.pageInfo,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsListAttestationsBulk200Response].
  factory OrgsListAttestationsBulk200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsListAttestationsBulk200Response',
      json,
      () => OrgsListAttestationsBulk200Response(
        attestationsSubjectDigests:
            (json['attestations_subject_digests'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(
                key,
                (value as List)
                    .map<
                      OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInner
                    >(
                      (e) =>
                          OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInner.fromJson(
                            e as Map<String, dynamic>,
                          ),
                    )
                    .toList(),
              ),
            ),
        pageInfo: OrgsListAttestationsBulk200ResponsePageInfo.maybeFromJson(
          json['page_info'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsListAttestationsBulk200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsListAttestationsBulk200Response.fromJson(json);
  }

  /// Mapping of subject digest to bundles.
  final Map<
    String,
    List<OrgsListAttestationsBulk200ResponseAttestationsSubjectDigestsInner>
  >?
  attestationsSubjectDigests;

  /// Information about the current page.
  final OrgsListAttestationsBulk200ResponsePageInfo? pageInfo;

  /// Converts an [OrgsListAttestationsBulk200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'attestations_subject_digests': ?attestationsSubjectDigests?.map(
        (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()),
      ),
      'page_info': ?pageInfo?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([mapHash(attestationsSubjectDigests), pageInfo]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsListAttestationsBulk200Response &&
        mapsEqual(
          attestationsSubjectDigests,
          other.attestationsSubjectDigests,
        ) &&
        pageInfo == other.pageInfo;
  }
}
