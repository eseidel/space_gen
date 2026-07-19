import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsListAttestationsBulkRequest {
  const OrgsListAttestationsBulkRequest({
    required this.subjectDigests,
    this.predicateType,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgsListAttestationsBulkRequest].
  factory OrgsListAttestationsBulkRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsListAttestationsBulkRequest',
      json,
      () => OrgsListAttestationsBulkRequest(
        subjectDigests: (json['subject_digests'] as List).cast<String>(),
        predicateType: json['predicate_type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsListAttestationsBulkRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsListAttestationsBulkRequest.fromJson(json);
  }

  /// List of subject digests to fetch attestations for.
  final List<String> subjectDigests;

  /// Optional filter for fetching attestations with a given predicate type.
  /// This option accepts `provenance`, `sbom`, or freeform text for custom
  /// predicate types.
  final String? predicateType;

  /// Converts an [OrgsListAttestationsBulkRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'subject_digests': subjectDigests,
      'predicate_type': ?predicateType,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(subjectDigests), predicateType]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsListAttestationsBulkRequest &&
        listsEqual(subjectDigests, other.subjectDigests) &&
        predicateType == other.predicateType;
  }
}
