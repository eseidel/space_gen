import 'package:github/model_helpers.dart';
import 'package:github/models/code_of_conduct_simple.dart';
import 'package:github/models/community_health_file.dart';
import 'package:github/models/license_simple.dart';
import 'package:meta/meta.dart';

@immutable
class CommunityProfileFiles {
  const CommunityProfileFiles({
    required this.codeOfConduct,
    required this.codeOfConductFile,
    required this.license,
    required this.contributing,
    required this.readme,
    required this.issueTemplate,
    required this.pullRequestTemplate,
  });

  /// Converts a `Map<String, dynamic>` to a [CommunityProfileFiles].
  factory CommunityProfileFiles.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommunityProfileFiles',
      json,
      () => CommunityProfileFiles(
        codeOfConduct: CodeOfConductSimple.maybeFromJson(
          checkedKey(json, 'code_of_conduct') as Map<String, dynamic>?,
        ),
        codeOfConductFile: CommunityHealthFile.maybeFromJson(
          checkedKey(json, 'code_of_conduct_file') as Map<String, dynamic>?,
        ),
        license: LicenseSimple.maybeFromJson(
          checkedKey(json, 'license') as Map<String, dynamic>?,
        ),
        contributing: CommunityHealthFile.maybeFromJson(
          checkedKey(json, 'contributing') as Map<String, dynamic>?,
        ),
        readme: CommunityHealthFile.maybeFromJson(
          checkedKey(json, 'readme') as Map<String, dynamic>?,
        ),
        issueTemplate: CommunityHealthFile.maybeFromJson(
          checkedKey(json, 'issue_template') as Map<String, dynamic>?,
        ),
        pullRequestTemplate: CommunityHealthFile.maybeFromJson(
          checkedKey(json, 'pull_request_template') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommunityProfileFiles? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommunityProfileFiles.fromJson(json);
  }

  /// Code Of Conduct Simple
  /// Code of Conduct Simple
  final CodeOfConductSimple? codeOfConduct;

  /// Community Health File
  final CommunityHealthFile? codeOfConductFile;

  /// License Simple
  /// License Simple
  final LicenseSimple? license;

  /// Community Health File
  final CommunityHealthFile? contributing;

  /// Community Health File
  final CommunityHealthFile? readme;

  /// Community Health File
  final CommunityHealthFile? issueTemplate;

  /// Community Health File
  final CommunityHealthFile? pullRequestTemplate;

  /// Converts a [CommunityProfileFiles] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'code_of_conduct': codeOfConduct?.toJson(),
      'code_of_conduct_file': codeOfConductFile?.toJson(),
      'license': license?.toJson(),
      'contributing': contributing?.toJson(),
      'readme': readme?.toJson(),
      'issue_template': issueTemplate?.toJson(),
      'pull_request_template': pullRequestTemplate?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    codeOfConduct,
    codeOfConductFile,
    license,
    contributing,
    readme,
    issueTemplate,
    pullRequestTemplate,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommunityProfileFiles &&
        codeOfConduct == other.codeOfConduct &&
        codeOfConductFile == other.codeOfConductFile &&
        license == other.license &&
        contributing == other.contributing &&
        readme == other.readme &&
        issueTemplate == other.issueTemplate &&
        pullRequestTemplate == other.pullRequestTemplate;
  }
}
