// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:github/models/checks_create_request_one_of_0_actions_inner.dart';
import 'package:github/models/checks_create_request_one_of_0_conclusion.dart';
import 'package:github/models/checks_create_request_one_of_0_output.dart';
import 'package:github/models/checks_create_request_one_of_0_status.dart';
import 'package:github/models/checks_create_request_one_of_1_actions_inner.dart';
import 'package:github/models/checks_create_request_one_of_1_conclusion.dart';
import 'package:github/models/checks_create_request_one_of_1_output.dart';
import 'package:github/models/checks_create_request_one_of_1_status.dart';
import 'package:meta/meta.dart';

sealed class ChecksCreateRequest {
  const ChecksCreateRequest();

  factory ChecksCreateRequest.fromJson(Map<String, dynamic> json) {
    final discriminator = json['status'];
    return switch (discriminator) {
      'completed' => ChecksCreateRequestOneOf0.fromJson(json),
      'queued' => ChecksCreateRequestOneOf1.fromJson(json),
      'in_progress' => ChecksCreateRequestOneOf1.fromJson(json),
      _ => throw FormatException(
        "Unknown status '$discriminator' for ChecksCreateRequest",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksCreateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ChecksCreateRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ChecksCreateRequestOneOf0 extends ChecksCreateRequest {
  const ChecksCreateRequestOneOf0({
    required this.name,
    required this.headSha,
    required this.status,
    required this.conclusion,
    required this.entries,
    this.detailsUrl,
    this.externalId,
    this.startedAt,
    this.completedAt,
    this.output,
    this.actions,
  });

  /// Converts a `Map<String, dynamic>` to a [ChecksCreateRequestOneOf0].
  factory ChecksCreateRequestOneOf0.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChecksCreateRequestOneOf0',
      json,
      () => ChecksCreateRequestOneOf0(
        name: json['name'] as String,
        headSha: json['head_sha'] as String,
        detailsUrl: json['details_url'] as String?,
        externalId: json['external_id'] as String?,
        status: ChecksCreateRequestOneOf0Status.fromJson(
          json['status'] as String,
        ),
        startedAt: maybeParseDateTime(json['started_at'] as String?),
        conclusion: ChecksCreateRequestOneOf0Conclusion.fromJson(
          json['conclusion'] as String,
        ),
        completedAt: maybeParseDateTime(json['completed_at'] as String?),
        output: ChecksCreateRequestOneOf0Output.maybeFromJson(
          json['output'] as Map<String, dynamic>?,
        ),
        actions: (json['actions'] as List?)
            ?.map<ChecksCreateRequestOneOf0ActionsInner>(
              (e) => ChecksCreateRequestOneOf0ActionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'name',
              'head_sha',
              'details_url',
              'external_id',
              'status',
              'started_at',
              'conclusion',
              'completed_at',
              'output',
              'actions',
            }.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksCreateRequestOneOf0? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ChecksCreateRequestOneOf0.fromJson(json);
  }

  /// The name of the check. For example, "code-coverage".
  final String name;

  /// The SHA of the commit.
  final String headSha;

  /// The URL of the integrator's site that has the full details of the check.
  /// If the integrator does not provide this, then the homepage of the GitHub
  /// app is used.
  final String? detailsUrl;

  /// A reference for the run on the integrator's system.
  final String? externalId;
  final ChecksCreateRequestOneOf0Status status;

  /// The time that the check run began. This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? startedAt;

  /// **Required if you provide `completed_at` or a `status` of `completed`**.
  /// The final conclusion of the check.
  /// **Note:** Providing `conclusion` will automatically set the `status`
  /// parameter to `completed`. You cannot change a check run conclusion to
  /// `stale`, only GitHub can set this.
  final ChecksCreateRequestOneOf0Conclusion conclusion;

  /// The time the check completed. This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? completedAt;

  /// Check runs can accept a variety of data in the `output` object,
  /// including a `title` and `summary` and can optionally provide descriptive
  /// details about the run.
  final ChecksCreateRequestOneOf0Output? output;

  /// Displays a button on GitHub that can be clicked to alert your app to do
  /// additional tasks. For example, a code linting app can display a button
  /// that automatically fixes detected errors. The button created in this
  /// object is displayed after the check run completes. When a user clicks
  /// the button, GitHub sends the [`check_run.requested_action`
  /// webhook](https://docs.github.com/webhooks/event-payloads/#check_run) to
  /// your app. Each action includes a `label`, `identifier` and
  /// `description`. A maximum of three actions are accepted. To learn more
  /// about check runs and requested actions, see "[Check runs and requested
  /// actions](https://docs.github.com/rest/guides/using-the-rest-api-to-interact-with-checks#check-runs-and-requested-actions)."
  final List<ChecksCreateRequestOneOf0ActionsInner>? actions;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'name' => name,
    'head_sha' => headSha,
    'details_url' => detailsUrl,
    'external_id' => externalId,
    'status' => status,
    'started_at' => startedAt,
    'conclusion' => conclusion,
    'completed_at' => completedAt,
    'output' => output,
    'actions' => actions,
    _ => entries[key],
  };

  /// Converts a [ChecksCreateRequestOneOf0] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'head_sha': headSha,
      'details_url': ?detailsUrl,
      'external_id': ?externalId,
      'status': status.toJson(),
      'started_at': ?startedAt?.toIso8601String(),
      'conclusion': conclusion.toJson(),
      'completed_at': ?completedAt?.toIso8601String(),
      'output': ?output?.toJson(),
      'actions': ?actions?.map((e) => e.toJson()).toList(),
      for (final entry in entries.entries)
        if (!const {
          'name',
          'head_sha',
          'details_url',
          'external_id',
          'status',
          'started_at',
          'conclusion',
          'completed_at',
          'output',
          'actions',
        }.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    headSha,
    detailsUrl,
    externalId,
    status,
    startedAt,
    conclusion,
    completedAt,
    output,
    listHash(actions),
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksCreateRequestOneOf0 &&
        name == other.name &&
        headSha == other.headSha &&
        detailsUrl == other.detailsUrl &&
        externalId == other.externalId &&
        status == other.status &&
        startedAt == other.startedAt &&
        conclusion == other.conclusion &&
        completedAt == other.completedAt &&
        output == other.output &&
        listsEqual(actions, other.actions) &&
        mapsEqual(entries, other.entries);
  }
}

@immutable
final class ChecksCreateRequestOneOf1 extends ChecksCreateRequest {
  const ChecksCreateRequestOneOf1({
    required this.name,
    required this.headSha,
    required this.entries,
    this.detailsUrl,
    this.externalId,
    this.status,
    this.startedAt,
    this.conclusion,
    this.completedAt,
    this.output,
    this.actions,
  });

  /// Converts a `Map<String, dynamic>` to a [ChecksCreateRequestOneOf1].
  factory ChecksCreateRequestOneOf1.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChecksCreateRequestOneOf1',
      json,
      () => ChecksCreateRequestOneOf1(
        name: json['name'] as String,
        headSha: json['head_sha'] as String,
        detailsUrl: json['details_url'] as String?,
        externalId: json['external_id'] as String?,
        status: ChecksCreateRequestOneOf1Status.maybeFromJson(
          json['status'] as String?,
        ),
        startedAt: maybeParseDateTime(json['started_at'] as String?),
        conclusion: ChecksCreateRequestOneOf1Conclusion.maybeFromJson(
          json['conclusion'] as String?,
        ),
        completedAt: maybeParseDateTime(json['completed_at'] as String?),
        output: ChecksCreateRequestOneOf1Output.maybeFromJson(
          json['output'] as Map<String, dynamic>?,
        ),
        actions: (json['actions'] as List?)
            ?.map<ChecksCreateRequestOneOf1ActionsInner>(
              (e) => ChecksCreateRequestOneOf1ActionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'name',
              'head_sha',
              'details_url',
              'external_id',
              'status',
              'started_at',
              'conclusion',
              'completed_at',
              'output',
              'actions',
            }.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksCreateRequestOneOf1? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ChecksCreateRequestOneOf1.fromJson(json);
  }

  /// The name of the check. For example, "code-coverage".
  final String name;

  /// The SHA of the commit.
  final String headSha;

  /// The URL of the integrator's site that has the full details of the check.
  /// If the integrator does not provide this, then the homepage of the GitHub
  /// app is used.
  final String? detailsUrl;

  /// A reference for the run on the integrator's system.
  final String? externalId;
  final ChecksCreateRequestOneOf1Status? status;

  /// The time that the check run began. This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? startedAt;

  /// **Required if you provide `completed_at` or a `status` of `completed`**.
  /// The final conclusion of the check.
  /// **Note:** Providing `conclusion` will automatically set the `status`
  /// parameter to `completed`. You cannot change a check run conclusion to
  /// `stale`, only GitHub can set this.
  final ChecksCreateRequestOneOf1Conclusion? conclusion;

  /// The time the check completed. This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? completedAt;

  /// Check runs can accept a variety of data in the `output` object,
  /// including a `title` and `summary` and can optionally provide descriptive
  /// details about the run.
  final ChecksCreateRequestOneOf1Output? output;

  /// Displays a button on GitHub that can be clicked to alert your app to do
  /// additional tasks. For example, a code linting app can display a button
  /// that automatically fixes detected errors. The button created in this
  /// object is displayed after the check run completes. When a user clicks
  /// the button, GitHub sends the [`check_run.requested_action`
  /// webhook](https://docs.github.com/webhooks/event-payloads/#check_run) to
  /// your app. Each action includes a `label`, `identifier` and
  /// `description`. A maximum of three actions are accepted. To learn more
  /// about check runs and requested actions, see "[Check runs and requested
  /// actions](https://docs.github.com/rest/guides/using-the-rest-api-to-interact-with-checks#check-runs-and-requested-actions)."
  final List<ChecksCreateRequestOneOf1ActionsInner>? actions;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'name' => name,
    'head_sha' => headSha,
    'details_url' => detailsUrl,
    'external_id' => externalId,
    'status' => status,
    'started_at' => startedAt,
    'conclusion' => conclusion,
    'completed_at' => completedAt,
    'output' => output,
    'actions' => actions,
    _ => entries[key],
  };

  /// Converts a [ChecksCreateRequestOneOf1] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'head_sha': headSha,
      'details_url': ?detailsUrl,
      'external_id': ?externalId,
      'status': ?status?.toJson(),
      'started_at': ?startedAt?.toIso8601String(),
      'conclusion': ?conclusion?.toJson(),
      'completed_at': ?completedAt?.toIso8601String(),
      'output': ?output?.toJson(),
      'actions': ?actions?.map((e) => e.toJson()).toList(),
      for (final entry in entries.entries)
        if (!const {
          'name',
          'head_sha',
          'details_url',
          'external_id',
          'status',
          'started_at',
          'conclusion',
          'completed_at',
          'output',
          'actions',
        }.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    headSha,
    detailsUrl,
    externalId,
    status,
    startedAt,
    conclusion,
    completedAt,
    output,
    listHash(actions),
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksCreateRequestOneOf1 &&
        name == other.name &&
        headSha == other.headSha &&
        detailsUrl == other.detailsUrl &&
        externalId == other.externalId &&
        status == other.status &&
        startedAt == other.startedAt &&
        conclusion == other.conclusion &&
        completedAt == other.completedAt &&
        output == other.output &&
        listsEqual(actions, other.actions) &&
        mapsEqual(entries, other.entries);
  }
}
