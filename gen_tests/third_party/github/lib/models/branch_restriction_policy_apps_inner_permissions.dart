// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchRestrictionPolicyAppsInnerPermissions {
  const BranchRestrictionPolicyAppsInnerPermissions({
    this.metadata,
    this.contents,
    this.issues,
    this.singleFile,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [BranchRestrictionPolicyAppsInnerPermissions].
  factory BranchRestrictionPolicyAppsInnerPermissions.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BranchRestrictionPolicyAppsInnerPermissions',
      json,
      () => BranchRestrictionPolicyAppsInnerPermissions(
        metadata: json['metadata'] as String?,
        contents: json['contents'] as String?,
        issues: json['issues'] as String?,
        singleFile: json['single_file'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchRestrictionPolicyAppsInnerPermissions? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BranchRestrictionPolicyAppsInnerPermissions.fromJson(json);
  }

  final String? metadata;
  final String? contents;
  final String? issues;
  final String? singleFile;

  /// Converts a [BranchRestrictionPolicyAppsInnerPermissions]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'metadata': ?metadata,
      'contents': ?contents,
      'issues': ?issues,
      'single_file': ?singleFile,
    };
  }

  @override
  int get hashCode => Object.hashAll([metadata, contents, issues, singleFile]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchRestrictionPolicyAppsInnerPermissions &&
        metadata == other.metadata &&
        contents == other.contents &&
        issues == other.issues &&
        singleFile == other.singleFile;
  }
}
