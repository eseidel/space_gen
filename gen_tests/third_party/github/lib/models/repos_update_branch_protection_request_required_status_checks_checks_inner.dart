// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner {
  const ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner({
    required this.context,
    this.appId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner].
  factory ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner',
      json,
      () => ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner(
        context: json['context'] as String,
        appId: json['app_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner.fromJson(
      json,
    );
  }

  /// The name of the required check
  final String context;

  /// The ID of the GitHub App that must provide this check. Omit this field
  /// to automatically select the GitHub App that has recently provided this
  /// check, or any app if it was not set by a GitHub App. Pass -1 to
  /// explicitly allow any app to set the status.
  final int? appId;

  /// Converts a [ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'context': context, 'app_id': ?appId};
  }

  @override
  int get hashCode => Object.hashAll([context, appId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ReposUpdateBranchProtectionRequestRequiredStatusChecksChecksInner &&
        context == other.context &&
        appId == other.appId;
  }
}
