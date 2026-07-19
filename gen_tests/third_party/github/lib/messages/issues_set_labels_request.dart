// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/issues_set_labels_request_one_of_2_labels_inner.dart';
import 'package:github/models/issues_set_labels_request_one_of_3_inner.dart';
import 'package:meta/meta.dart';

sealed class IssuesSetLabelsRequest {
  const IssuesSetLabelsRequest();

  factory IssuesSetLabelsRequest.fromJson(dynamic json) {
    return switch (json) {
      final String v => IssuesSetLabelsRequestString(v),
      final Map<String, dynamic> v
          when v['labels'] is List &&
              (v['labels'] as List).isNotEmpty &&
              (v['labels'] as List).first is String =>
        IssuesSetLabelsRequestOneOf0.fromJson(v),
      final Map<String, dynamic> v => IssuesSetLabelsRequestOneOf2.fromJson(v),
      final List<dynamic> v when v.isNotEmpty && v.first is String =>
        IssuesSetLabelsRequestList(v.cast<String>()),
      final List<dynamic> v
          when v.isNotEmpty && v.first is Map<String, dynamic> =>
        IssuesSetLabelsRequestList2(
          v
              .map<IssuesSetLabelsRequestOneOf3Inner>(
                (e) => IssuesSetLabelsRequestOneOf3Inner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      List<dynamic> _ => throw const FormatException(
        'No variant of IssuesSetLabelsRequest matched first list element',
      ),
      _ => throw FormatException(
        'Unsupported shape for IssuesSetLabelsRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesSetLabelsRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return IssuesSetLabelsRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class IssuesSetLabelsRequestList extends IssuesSetLabelsRequest {
  const IssuesSetLabelsRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesSetLabelsRequestList && value == other.value;
  }
}

@immutable
final class IssuesSetLabelsRequestList2 extends IssuesSetLabelsRequest {
  const IssuesSetLabelsRequestList2(this.value);

  final List<IssuesSetLabelsRequestOneOf3Inner> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesSetLabelsRequestList2 && value == other.value;
  }
}

@immutable
final class IssuesSetLabelsRequestString extends IssuesSetLabelsRequest {
  const IssuesSetLabelsRequestString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesSetLabelsRequestString && value == other.value;
  }
}

@immutable
final class IssuesSetLabelsRequestOneOf0 extends IssuesSetLabelsRequest {
  const IssuesSetLabelsRequestOneOf0({this.labels});

  /// Converts a `Map<String, dynamic>` to an [IssuesSetLabelsRequestOneOf0].
  factory IssuesSetLabelsRequestOneOf0.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesSetLabelsRequestOneOf0',
      json,
      () => IssuesSetLabelsRequestOneOf0(
        labels: (json['labels'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesSetLabelsRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesSetLabelsRequestOneOf0.fromJson(json);
  }

  /// The names of the labels to set for the issue. The labels you set replace
  /// any existing labels. You can pass an empty array to remove all labels.
  /// Alternatively, you can pass a single label as a `string` or an `array`
  /// of labels directly, but GitHub recommends passing an object with the
  /// `labels` key. You can also add labels to the existing labels for an
  /// issue. For more information, see "[Add labels to an
  /// issue](https://docs.github.com/rest/issues/labels#add-labels-to-an-issue)."
  final List<String>? labels;

  /// Converts an [IssuesSetLabelsRequestOneOf0] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {if (labels != null) 'labels': labels};
  }

  @override
  int get hashCode => listHash(labels).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesSetLabelsRequestOneOf0 &&
        listsEqual(labels, other.labels);
  }
}

@immutable
final class IssuesSetLabelsRequestOneOf2 extends IssuesSetLabelsRequest {
  const IssuesSetLabelsRequestOneOf2({this.labels});

  /// Converts a `Map<String, dynamic>` to an [IssuesSetLabelsRequestOneOf2].
  factory IssuesSetLabelsRequestOneOf2.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesSetLabelsRequestOneOf2',
      json,
      () => IssuesSetLabelsRequestOneOf2(
        labels: (json['labels'] as List?)
            ?.map<IssuesSetLabelsRequestOneOf2LabelsInner>(
              (e) => IssuesSetLabelsRequestOneOf2LabelsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesSetLabelsRequestOneOf2? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesSetLabelsRequestOneOf2.fromJson(json);
  }

  final List<IssuesSetLabelsRequestOneOf2LabelsInner>? labels;

  /// Converts an [IssuesSetLabelsRequestOneOf2] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      if (labels != null) 'labels': labels?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => listHash(labels).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesSetLabelsRequestOneOf2 &&
        listsEqual(labels, other.labels);
  }
}
