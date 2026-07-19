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
import 'package:github/models/checks_update_request_any_of_0_actions_inner.dart';
import 'package:github/models/checks_update_request_any_of_0_conclusion.dart';
import 'package:github/models/checks_update_request_any_of_0_output.dart';
import 'package:github/models/checks_update_request_any_of_0_status.dart';
import 'package:github/models/checks_update_request_any_of_1_actions_inner.dart';
import 'package:github/models/checks_update_request_any_of_1_conclusion.dart';
import 'package:github/models/checks_update_request_any_of_1_output.dart';
import 'package:github/models/checks_update_request_any_of_1_status.dart';
import 'package:meta/meta.dart';

sealed class ChecksUpdateRequest {
  const ChecksUpdateRequest();

  factory ChecksUpdateRequest.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('conclusion')) {
      return ChecksUpdateRequestAnyOf0.fromJson(json);
    }
    return ChecksUpdateRequestAnyOf1.fromJson(json);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksUpdateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ChecksUpdateRequestAnyOf0 extends ChecksUpdateRequest {
  const ChecksUpdateRequestAnyOf0({
    required this.conclusion,
    required this.entries,
    this.name,
    this.detailsUrl,
    this.externalId,
    this.startedAt,
    this.status,
    this.completedAt,
    this.output,
    this.actions,
  });

  /// Converts a `Map<String, dynamic>` to a [ChecksUpdateRequestAnyOf0].
  factory ChecksUpdateRequestAnyOf0.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChecksUpdateRequestAnyOf0',
      json,
      () => ChecksUpdateRequestAnyOf0(
        name: json['name'] as String?,
        detailsUrl: json['details_url'] as String?,
        externalId: json['external_id'] as String?,
        startedAt: maybeParseDateTime(json['started_at'] as String?),
        status: ChecksUpdateRequestAnyOf0Status.maybeFromJson(
          json['status'] as String?,
        ),
        conclusion: ChecksUpdateRequestAnyOf0Conclusion.fromJson(
          json['conclusion'] as String,
        ),
        completedAt: maybeParseDateTime(json['completed_at'] as String?),
        output: ChecksUpdateRequestAnyOf0Output.maybeFromJson(
          json['output'] as Map<String, dynamic>?,
        ),
        actions: (json['actions'] as List?)
            ?.map<ChecksUpdateRequestAnyOf0ActionsInner>(
              (e) => ChecksUpdateRequestAnyOf0ActionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'name',
              'details_url',
              'external_id',
              'started_at',
              'status',
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
  static ChecksUpdateRequestAnyOf0? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequestAnyOf0.fromJson(json);
  }

  /// The name of the check. For example, "code-coverage".
  final String? name;

  /// The URL of the integrator's site that has the full details of the check.
  final String? detailsUrl;

  /// A reference for the run on the integrator's system.
  final String? externalId;

  /// This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? startedAt;
  final ChecksUpdateRequestAnyOf0Status? status;

  /// **Required if you provide `completed_at` or a `status` of `completed`**.
  /// The final conclusion of the check.
  /// **Note:** Providing `conclusion` will automatically set the `status`
  /// parameter to `completed`. You cannot change a check run conclusion to
  /// `stale`, only GitHub can set this.
  final ChecksUpdateRequestAnyOf0Conclusion conclusion;

  /// The time the check completed. This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? completedAt;

  /// Check runs can accept a variety of data in the `output` object,
  /// including a `title` and `summary` and can optionally provide descriptive
  /// details about the run.
  final ChecksUpdateRequestAnyOf0Output? output;

  /// Possible further actions the integrator can perform, which a user may
  /// trigger. Each action includes a `label`, `identifier` and `description`.
  /// A maximum of three actions are accepted. To learn more about check runs
  /// and requested actions, see "[Check runs and requested
  /// actions](https://docs.github.com/rest/guides/using-the-rest-api-to-interact-with-checks#check-runs-and-requested-actions)."
  final List<ChecksUpdateRequestAnyOf0ActionsInner>? actions;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'name' => name,
    'details_url' => detailsUrl,
    'external_id' => externalId,
    'started_at' => startedAt,
    'status' => status,
    'conclusion' => conclusion,
    'completed_at' => completedAt,
    'output' => output,
    'actions' => actions,
    _ => entries[key],
  };

  /// Converts a [ChecksUpdateRequestAnyOf0] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'details_url': detailsUrl,
      'external_id': externalId,
      'started_at': startedAt?.toIso8601String(),
      'status': status?.toJson(),
      'conclusion': conclusion.toJson(),
      'completed_at': completedAt?.toIso8601String(),
      'output': output?.toJson(),
      'actions': actions?.map((e) => e.toJson()).toList(),
      for (final entry in entries.entries)
        if (!const {
          'name',
          'details_url',
          'external_id',
          'started_at',
          'status',
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
    detailsUrl,
    externalId,
    startedAt,
    status,
    conclusion,
    completedAt,
    output,
    listHash(actions),
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksUpdateRequestAnyOf0 &&
        name == other.name &&
        detailsUrl == other.detailsUrl &&
        externalId == other.externalId &&
        startedAt == other.startedAt &&
        status == other.status &&
        conclusion == other.conclusion &&
        completedAt == other.completedAt &&
        output == other.output &&
        listsEqual(actions, other.actions) &&
        mapsEqual(entries, other.entries);
  }
}

@immutable
final class ChecksUpdateRequestAnyOf1 extends ChecksUpdateRequest {
  const ChecksUpdateRequestAnyOf1({
    required this.entries,
    this.name,
    this.detailsUrl,
    this.externalId,
    this.startedAt,
    this.status,
    this.conclusion,
    this.completedAt,
    this.output,
    this.actions,
  });

  /// Converts a `Map<String, dynamic>` to a [ChecksUpdateRequestAnyOf1].
  factory ChecksUpdateRequestAnyOf1.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChecksUpdateRequestAnyOf1',
      json,
      () => ChecksUpdateRequestAnyOf1(
        name: json['name'] as String?,
        detailsUrl: json['details_url'] as String?,
        externalId: json['external_id'] as String?,
        startedAt: maybeParseDateTime(json['started_at'] as String?),
        status: ChecksUpdateRequestAnyOf1Status.maybeFromJson(
          json['status'] as String?,
        ),
        conclusion: ChecksUpdateRequestAnyOf1Conclusion.maybeFromJson(
          json['conclusion'] as String?,
        ),
        completedAt: maybeParseDateTime(json['completed_at'] as String?),
        output: ChecksUpdateRequestAnyOf1Output.maybeFromJson(
          json['output'] as Map<String, dynamic>?,
        ),
        actions: (json['actions'] as List?)
            ?.map<ChecksUpdateRequestAnyOf1ActionsInner>(
              (e) => ChecksUpdateRequestAnyOf1ActionsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'name',
              'details_url',
              'external_id',
              'started_at',
              'status',
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
  static ChecksUpdateRequestAnyOf1? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequestAnyOf1.fromJson(json);
  }

  /// The name of the check. For example, "code-coverage".
  final String? name;

  /// The URL of the integrator's site that has the full details of the check.
  final String? detailsUrl;

  /// A reference for the run on the integrator's system.
  final String? externalId;

  /// This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? startedAt;
  final ChecksUpdateRequestAnyOf1Status? status;

  /// **Required if you provide `completed_at` or a `status` of `completed`**.
  /// The final conclusion of the check.
  /// **Note:** Providing `conclusion` will automatically set the `status`
  /// parameter to `completed`. You cannot change a check run conclusion to
  /// `stale`, only GitHub can set this.
  final ChecksUpdateRequestAnyOf1Conclusion? conclusion;

  /// The time the check completed. This is a timestamp in [ISO
  /// 8601](https://en.wikipedia.org/wiki/ISO_8601) format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? completedAt;

  /// Check runs can accept a variety of data in the `output` object,
  /// including a `title` and `summary` and can optionally provide descriptive
  /// details about the run.
  final ChecksUpdateRequestAnyOf1Output? output;

  /// Possible further actions the integrator can perform, which a user may
  /// trigger. Each action includes a `label`, `identifier` and `description`.
  /// A maximum of three actions are accepted. To learn more about check runs
  /// and requested actions, see "[Check runs and requested
  /// actions](https://docs.github.com/rest/guides/using-the-rest-api-to-interact-with-checks#check-runs-and-requested-actions)."
  final List<ChecksUpdateRequestAnyOf1ActionsInner>? actions;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'name' => name,
    'details_url' => detailsUrl,
    'external_id' => externalId,
    'started_at' => startedAt,
    'status' => status,
    'conclusion' => conclusion,
    'completed_at' => completedAt,
    'output' => output,
    'actions' => actions,
    _ => entries[key],
  };

  /// Converts a [ChecksUpdateRequestAnyOf1] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'details_url': detailsUrl,
      'external_id': externalId,
      'started_at': startedAt?.toIso8601String(),
      'status': status?.toJson(),
      'conclusion': conclusion?.toJson(),
      'completed_at': completedAt?.toIso8601String(),
      'output': output?.toJson(),
      'actions': actions?.map((e) => e.toJson()).toList(),
      for (final entry in entries.entries)
        if (!const {
          'name',
          'details_url',
          'external_id',
          'started_at',
          'status',
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
    detailsUrl,
    externalId,
    startedAt,
    status,
    conclusion,
    completedAt,
    output,
    listHash(actions),
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksUpdateRequestAnyOf1 &&
        name == other.name &&
        detailsUrl == other.detailsUrl &&
        externalId == other.externalId &&
        startedAt == other.startedAt &&
        status == other.status &&
        conclusion == other.conclusion &&
        completedAt == other.completedAt &&
        output == other.output &&
        listsEqual(actions, other.actions) &&
        mapsEqual(entries, other.entries);
  }
}
