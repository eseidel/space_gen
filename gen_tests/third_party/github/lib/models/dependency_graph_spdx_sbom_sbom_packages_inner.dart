// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/dependency_graph_spdx_sbom_sbom_packages_inner_external_refs_inner.dart';
import 'package:meta/meta.dart';

@immutable
class DependencyGraphSpdxSbomSbomPackagesInner {
  const DependencyGraphSpdxSbomSbomPackagesInner({
    this.spdxid,
    this.name,
    this.versionInfo,
    this.downloadLocation,
    this.filesAnalyzed,
    this.licenseConcluded,
    this.licenseDeclared,
    this.supplier,
    this.copyrightText,
    this.externalRefs,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependencyGraphSpdxSbomSbomPackagesInner].
  factory DependencyGraphSpdxSbomSbomPackagesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependencyGraphSpdxSbomSbomPackagesInner',
      json,
      () => DependencyGraphSpdxSbomSbomPackagesInner(
        spdxid: json['SPDXID'] as String?,
        name: json['name'] as String?,
        versionInfo: json['versionInfo'] as String?,
        downloadLocation: json['downloadLocation'] as String?,
        filesAnalyzed: json['filesAnalyzed'] as bool?,
        licenseConcluded: json['licenseConcluded'] as String?,
        licenseDeclared: json['licenseDeclared'] as String?,
        supplier: json['supplier'] as String?,
        copyrightText: json['copyrightText'] as String?,
        externalRefs: (json['externalRefs'] as List?)
            ?.map<DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner>(
              (e) =>
                  DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphSpdxSbomSbomPackagesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependencyGraphSpdxSbomSbomPackagesInner.fromJson(json);
  }

  /// A unique SPDX identifier for the package.
  /// Example: `'SPDXRef-Package'`
  final String? spdxid;

  /// The name of the package.
  /// Example: `'github/github'`
  final String? name;

  /// The version of the package. If the package does not have an exact
  /// version specified,
  /// a version range is given.
  /// Example: `'1.0.0'`
  final String? versionInfo;

  /// The location where the package can be downloaded,
  /// or NOASSERTION if this has not been determined.
  /// Example: `'NOASSERTION'`
  final String? downloadLocation;

  /// Whether the package's file content has been subjected to
  /// analysis during the creation of the SPDX document.
  /// Example: `false`
  final bool? filesAnalyzed;

  /// The license of the package as determined while creating the SPDX
  /// document.
  /// Example: `'MIT'`
  final String? licenseConcluded;

  /// The license of the package as declared by its author, or NOASSERTION if
  /// this information
  /// was not available when the SPDX document was created.
  /// Example: `'NOASSERTION'`
  final String? licenseDeclared;

  /// The distribution source of this package, or NOASSERTION if this was not
  /// determined.
  /// Example: `'NOASSERTION'`
  final String? supplier;

  /// The copyright holders of the package, and any dates present with those
  /// notices, if available.
  /// Example: `'Copyright (c) 1985 GitHub.com'`
  final String? copyrightText;
  final List<DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner>?
  externalRefs;

  /// Converts a [DependencyGraphSpdxSbomSbomPackagesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'SPDXID': ?spdxid,
      'name': ?name,
      'versionInfo': ?versionInfo,
      'downloadLocation': ?downloadLocation,
      'filesAnalyzed': ?filesAnalyzed,
      'licenseConcluded': ?licenseConcluded,
      'licenseDeclared': ?licenseDeclared,
      'supplier': ?supplier,
      'copyrightText': ?copyrightText,
      'externalRefs': ?externalRefs?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    spdxid,
    name,
    versionInfo,
    downloadLocation,
    filesAnalyzed,
    licenseConcluded,
    licenseDeclared,
    supplier,
    copyrightText,
    listHash(externalRefs),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependencyGraphSpdxSbomSbomPackagesInner &&
        spdxid == other.spdxid &&
        name == other.name &&
        versionInfo == other.versionInfo &&
        downloadLocation == other.downloadLocation &&
        filesAnalyzed == other.filesAnalyzed &&
        licenseConcluded == other.licenseConcluded &&
        licenseDeclared == other.licenseDeclared &&
        supplier == other.supplier &&
        copyrightText == other.copyrightText &&
        listsEqual(externalRefs, other.externalRefs);
  }
}
