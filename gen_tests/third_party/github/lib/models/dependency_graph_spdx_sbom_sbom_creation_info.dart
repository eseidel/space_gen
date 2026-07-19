import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class DependencyGraphSpdxSbomSbomCreationInfo {
  const DependencyGraphSpdxSbomSbomCreationInfo({
    required this.created,
    required this.creators,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependencyGraphSpdxSbomSbomCreationInfo].
  factory DependencyGraphSpdxSbomSbomCreationInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependencyGraphSpdxSbomSbomCreationInfo',
      json,
      () => DependencyGraphSpdxSbomSbomCreationInfo(
        created: json['created'] as String,
        creators: (json['creators'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphSpdxSbomSbomCreationInfo? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependencyGraphSpdxSbomSbomCreationInfo.fromJson(json);
  }

  /// The date and time the SPDX document was created.
  /// Example: `'2021-11-03T00:00:00Z'`
  final String created;

  /// The tools that were used to generate the SPDX document.
  final List<String> creators;

  /// Converts a [DependencyGraphSpdxSbomSbomCreationInfo]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'created': created, 'creators': creators};
  }

  @override
  int get hashCode => Object.hashAll([created, listHash(creators)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependencyGraphSpdxSbomSbomCreationInfo &&
        created == other.created &&
        listsEqual(creators, other.creators);
  }
}
