import 'package:github/models/dependency_graph_diff_inner.dart';

/// Dependency Graph Diff
/// A diff of the dependencies between two commits.
extension type const DependencyGraphDiff._(List<DependencyGraphDiffInner> value)
    implements List<DependencyGraphDiffInner> {
  const DependencyGraphDiff(this.value);

  factory DependencyGraphDiff.fromJson(List<dynamic> json) =>
      DependencyGraphDiff(
        json
            .map<DependencyGraphDiffInner>(
              (e) =>
                  DependencyGraphDiffInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphDiff? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DependencyGraphDiff.fromJson(json);
  }

  List<dynamic> toJson() => value.map((e) => e.toJson()).toList();
}
