// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// The request body must include either `subject_digests` or `attestation_ids`,
/// but not both.
sealed class UsersDeleteAttestationsBulkRequest {
  const UsersDeleteAttestationsBulkRequest();

  factory UsersDeleteAttestationsBulkRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('subject_digests')) {
      return UsersDeleteAttestationsBulkRequestOneOf0.fromJson(json);
    }
    if (json.containsKey('attestation_ids')) {
      return UsersDeleteAttestationsBulkRequestOneOf1.fromJson(json);
    }
    throw FormatException(
      'No variant of UsersDeleteAttestationsBulkRequest matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersDeleteAttestationsBulkRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersDeleteAttestationsBulkRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class UsersDeleteAttestationsBulkRequestOneOf0
    extends UsersDeleteAttestationsBulkRequest {
  const UsersDeleteAttestationsBulkRequestOneOf0({
    required this.subjectDigests,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersDeleteAttestationsBulkRequestOneOf0].
  factory UsersDeleteAttestationsBulkRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersDeleteAttestationsBulkRequestOneOf0',
      json,
      () => UsersDeleteAttestationsBulkRequestOneOf0(
        subjectDigests: (json['subject_digests'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersDeleteAttestationsBulkRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersDeleteAttestationsBulkRequestOneOf0.fromJson(json);
  }

  /// List of subject digests associated with the artifact attestations to
  /// delete.
  final List<String> subjectDigests;

  /// Converts a [UsersDeleteAttestationsBulkRequestOneOf0]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'subject_digests': subjectDigests};
  }

  @override
  int get hashCode => listHash(subjectDigests).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersDeleteAttestationsBulkRequestOneOf0 &&
        listsEqual(subjectDigests, other.subjectDigests);
  }
}

@immutable
final class UsersDeleteAttestationsBulkRequestOneOf1
    extends UsersDeleteAttestationsBulkRequest {
  const UsersDeleteAttestationsBulkRequestOneOf1({
    required this.attestationIds,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersDeleteAttestationsBulkRequestOneOf1].
  factory UsersDeleteAttestationsBulkRequestOneOf1.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersDeleteAttestationsBulkRequestOneOf1',
      json,
      () => UsersDeleteAttestationsBulkRequestOneOf1(
        attestationIds: (json['attestation_ids'] as List).cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersDeleteAttestationsBulkRequestOneOf1? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersDeleteAttestationsBulkRequestOneOf1.fromJson(json);
  }

  /// List of unique IDs associated with the artifact attestations to delete.
  final List<int> attestationIds;

  /// Converts a [UsersDeleteAttestationsBulkRequestOneOf1]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'attestation_ids': attestationIds};
  }

  @override
  int get hashCode => listHash(attestationIds).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersDeleteAttestationsBulkRequestOneOf1 &&
        listsEqual(attestationIds, other.attestationIds);
  }
}
