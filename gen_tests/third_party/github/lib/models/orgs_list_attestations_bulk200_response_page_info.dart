import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template orgs_list_attestations_bulk200_response_page_info}
/// Information about the current page.
/// {@endtemplate}
@immutable
class OrgsListAttestationsBulk200ResponsePageInfo {
  /// {@macro orgs_list_attestations_bulk200_response_page_info}
  const OrgsListAttestationsBulk200ResponsePageInfo({
    this.hasNext,
    this.hasPrevious,
    this.next,
    this.previous,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsListAttestationsBulk200ResponsePageInfo].
  factory OrgsListAttestationsBulk200ResponsePageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsListAttestationsBulk200ResponsePageInfo',
      json,
      () => OrgsListAttestationsBulk200ResponsePageInfo(
        hasNext: json['has_next'] as bool?,
        hasPrevious: json['has_previous'] as bool?,
        next: json['next'] as String?,
        previous: json['previous'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsListAttestationsBulk200ResponsePageInfo? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsListAttestationsBulk200ResponsePageInfo.fromJson(json);
  }

  /// Indicates whether there is a next page.
  final bool? hasNext;

  /// Indicates whether there is a previous page.
  final bool? hasPrevious;

  /// The cursor to the next page.
  final String? next;

  /// The cursor to the previous page.
  final String? previous;

  /// Converts an [OrgsListAttestationsBulk200ResponsePageInfo]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (hasNext != null) 'has_next': hasNext,
      if (hasPrevious != null) 'has_previous': hasPrevious,
      if (next != null) 'next': next,
      if (previous != null) 'previous': previous,
    };
  }

  @override
  int get hashCode => Object.hashAll([hasNext, hasPrevious, next, previous]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsListAttestationsBulk200ResponsePageInfo &&
        hasNext == other.hasNext &&
        hasPrevious == other.hasPrevious &&
        next == other.next &&
        previous == other.previous;
  }
}
