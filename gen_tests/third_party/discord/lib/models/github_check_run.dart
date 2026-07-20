import 'package:discord/api_exception.dart';
import 'package:discord/messages/github_check_pull_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/github_check_run_output_1.dart';
import 'package:discord/models/github_check_suite.dart';
import 'package:meta/meta.dart';

@immutable
class GithubCheckRun {
  GithubCheckRun({
    required this.name,
    required this.htmlUrl,
    required this.checkSuite,
    this.conclusion,
    this.detailsUrl,
    this.output,
    this.pullRequests,
  }) {
    conclusion?.validate(maxLength: 152133);
    name.validate(maxLength: 152133);
    pullRequests?.validate(maxItems: 1521);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubCheckRun].
  factory GithubCheckRun.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubCheckRun',
      json,
      () => GithubCheckRun(
        conclusion: json['conclusion'] as String?,
        name: json['name'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        checkSuite: GithubCheckSuite.fromJson(
          json['check_suite'] as Map<String, dynamic>,
        ),
        detailsUrl: maybeParseUri(json['details_url'] as String?),
        output: GithubCheckRunOutput1.maybeFromJson(
          json['output'] as Map<String, dynamic>?,
        ),
        pullRequests: (json['pull_requests'] as List?)
            ?.map<GithubCheckPullRequest>(
              (e) => GithubCheckPullRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubCheckRun? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubCheckRun.fromJson(json);
  }

  final String? conclusion;
  final String name;
  final Uri htmlUrl;
  final GithubCheckSuite checkSuite;
  final Uri? detailsUrl;
  final GithubCheckRunOutput1? output;
  final List<GithubCheckPullRequest>? pullRequests;

  /// Converts a [GithubCheckRun] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'conclusion': conclusion,
      'name': name,
      'html_url': htmlUrl.toString(),
      'check_suite': checkSuite.toJson(),
      'details_url': detailsUrl?.toString(),
      'output': output?.toJson(),
      'pull_requests': pullRequests?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    conclusion,
    name,
    htmlUrl,
    checkSuite,
    detailsUrl,
    output,
    listHash(pullRequests),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubCheckRun &&
        conclusion == other.conclusion &&
        name == other.name &&
        htmlUrl == other.htmlUrl &&
        checkSuite == other.checkSuite &&
        detailsUrl == other.detailsUrl &&
        output == other.output &&
        listsEqual(pullRequests, other.pullRequests);
  }
}
