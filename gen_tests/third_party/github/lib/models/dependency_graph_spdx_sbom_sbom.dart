// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/dependency_graph_spdx_sbom_sbom_creation_info.dart';
import 'package:github/models/dependency_graph_spdx_sbom_sbom_packages_inner.dart';
import 'package:github/models/dependency_graph_spdx_sbom_sbom_relationships_inner.dart';
import 'package:meta/meta.dart';

@immutable
class DependencyGraphSpdxSbomSbom {
  const DependencyGraphSpdxSbomSbom({
    required this.spdxid,
    required this.spdxVersion,
    required this.creationInfo,
    required this.name,
    required this.dataLicense,
    required this.documentNamespace,
    required this.packages,
    this.comment,
    this.relationships,
  });

  /// Converts a `Map<String, dynamic>` to a [DependencyGraphSpdxSbomSbom].
  factory DependencyGraphSpdxSbomSbom.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DependencyGraphSpdxSbomSbom',
      json,
      () => DependencyGraphSpdxSbomSbom(
        spdxid: json['SPDXID'] as String,
        spdxVersion: json['spdxVersion'] as String,
        comment: json['comment'] as String?,
        creationInfo: DependencyGraphSpdxSbomSbomCreationInfo.fromJson(
          json['creationInfo'] as Map<String, dynamic>,
        ),
        name: json['name'] as String,
        dataLicense: json['dataLicense'] as String,
        documentNamespace: json['documentNamespace'] as String,
        packages: (json['packages'] as List)
            .map<DependencyGraphSpdxSbomSbomPackagesInner>(
              (e) => DependencyGraphSpdxSbomSbomPackagesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        relationships: (json['relationships'] as List?)
            ?.map<DependencyGraphSpdxSbomSbomRelationshipsInner>(
              (e) => DependencyGraphSpdxSbomSbomRelationshipsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphSpdxSbomSbom? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependencyGraphSpdxSbomSbom.fromJson(json);
  }

  /// The SPDX identifier for the SPDX document.
  /// Example: `'SPDXRef-DOCUMENT'`
  final String spdxid;

  /// The version of the SPDX specification that this document conforms to.
  /// Example: `'SPDX-2.3'`
  final String spdxVersion;

  /// An optional comment about the SPDX document.
  /// Example: `'Exact versions could not be resolved for some packages. For more information: https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/'`
  final String? comment;
  final DependencyGraphSpdxSbomSbomCreationInfo creationInfo;

  /// The name of the SPDX document.
  /// Example: `'github/github'`
  final String name;

  /// The license under which the SPDX document is licensed.
  /// Example: `'CC0-1.0'`
  final String dataLicense;

  /// The namespace for the SPDX document.
  /// Example:
  /// `'https://spdx.org/spdxdocs/protobom/15e41dd2-f961-4f4d-b8dc-f8f57ad70d57'`
  final String documentNamespace;
  final List<DependencyGraphSpdxSbomSbomPackagesInner> packages;
  final List<DependencyGraphSpdxSbomSbomRelationshipsInner>? relationships;

  /// Converts a [DependencyGraphSpdxSbomSbom] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'SPDXID': spdxid,
      'spdxVersion': spdxVersion,
      'comment': comment,
      'creationInfo': creationInfo.toJson(),
      'name': name,
      'dataLicense': dataLicense,
      'documentNamespace': documentNamespace,
      'packages': packages.map((e) => e.toJson()).toList(),
      'relationships': relationships?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    spdxid,
    spdxVersion,
    comment,
    creationInfo,
    name,
    dataLicense,
    documentNamespace,
    listHash(packages),
    listHash(relationships),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependencyGraphSpdxSbomSbom &&
        spdxid == other.spdxid &&
        spdxVersion == other.spdxVersion &&
        comment == other.comment &&
        creationInfo == other.creationInfo &&
        name == other.name &&
        dataLicense == other.dataLicense &&
        documentNamespace == other.documentNamespace &&
        listsEqual(packages, other.packages) &&
        listsEqual(relationships, other.relationships);
  }
}
