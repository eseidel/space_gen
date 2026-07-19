import 'package:github/model_helpers.dart';
import 'package:github/models/dependency_graph_spdx_sbom_sbom.dart';
import 'package:meta/meta.dart';

/// {@template dependency_graph_spdx_sbom}
/// Dependency Graph SPDX SBOM
/// A schema for the SPDX JSON format returned by the Dependency Graph.
/// {@endtemplate}
@immutable
class DependencyGraphSpdxSbom {
  /// {@macro dependency_graph_spdx_sbom}
  const DependencyGraphSpdxSbom({required this.sbom});

  /// Converts a `Map<String, dynamic>` to a [DependencyGraphSpdxSbom].
  factory DependencyGraphSpdxSbom.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DependencyGraphSpdxSbom',
      json,
      () => DependencyGraphSpdxSbom(
        sbom: DependencyGraphSpdxSbomSbom.fromJson(
          json['sbom'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphSpdxSbom? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DependencyGraphSpdxSbom.fromJson(json);
  }

  final DependencyGraphSpdxSbomSbom sbom;

  /// Converts a [DependencyGraphSpdxSbom] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sbom': sbom.toJson()};
  }

  @override
  int get hashCode => sbom.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependencyGraphSpdxSbom && sbom == other.sbom;
  }
}
