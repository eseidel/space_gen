import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner {
  const DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner({
    required this.referenceCategory,
    required this.referenceLocator,
    required this.referenceType,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner].
  factory DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner',
      json,
      () => DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner(
        referenceCategory: json['referenceCategory'] as String,
        referenceLocator: json['referenceLocator'] as String,
        referenceType: json['referenceType'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner.fromJson(
      json,
    );
  }

  /// The category of reference to an external resource this reference refers
  /// to.
  /// Example: `'PACKAGE-MANAGER'`
  final String referenceCategory;

  /// A locator for the particular external resource this reference refers to.
  /// Example: `'pkg:gem/rails@6.0.1'`
  final String referenceLocator;

  /// The category of reference to an external resource this reference refers
  /// to.
  /// Example: `'purl'`
  final String referenceType;

  /// Converts a [DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'referenceCategory': referenceCategory,
      'referenceLocator': referenceLocator,
      'referenceType': referenceType,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([referenceCategory, referenceLocator, referenceType]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependencyGraphSpdxSbomSbomPackagesInnerExternalRefsInner &&
        referenceCategory == other.referenceCategory &&
        referenceLocator == other.referenceLocator &&
        referenceType == other.referenceType;
  }
}
