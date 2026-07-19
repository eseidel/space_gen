// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/issues_add_labels_request_one_of_2_labels_inner.dart';
import 'package:github/models/issues_add_labels_request_one_of_3_inner.dart';
import 'package:meta/meta.dart';

sealed class IssuesAddLabelsRequest {
  const IssuesAddLabelsRequest();

  factory IssuesAddLabelsRequest.fromJson(dynamic json) {
    return switch (json) {
      final String v => IssuesAddLabelsRequestString(v),
      final Map<String, dynamic> v
          when v['labels'] is List &&
              (v['labels'] as List).isNotEmpty &&
              (v['labels'] as List).first is String =>
        IssuesAddLabelsRequestOneOf0.fromJson(v),
      final Map<String, dynamic> v => IssuesAddLabelsRequestOneOf2.fromJson(v),
      final List<dynamic> v when v.isNotEmpty && v.first is String =>
        IssuesAddLabelsRequestList(v.cast<String>()),
      final List<dynamic> v
          when v.isNotEmpty && v.first is Map<String, dynamic> =>
        IssuesAddLabelsRequestList2(
          v
              .map<IssuesAddLabelsRequestOneOf3Inner>(
                (e) => IssuesAddLabelsRequestOneOf3Inner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      List<dynamic> _ => throw const FormatException(
        'No variant of IssuesAddLabelsRequest matched first list element',
      ),
      _ => throw FormatException(
        'Unsupported shape for IssuesAddLabelsRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesAddLabelsRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return IssuesAddLabelsRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class IssuesAddLabelsRequestList extends IssuesAddLabelsRequest {
  const IssuesAddLabelsRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesAddLabelsRequestList && value == other.value;
  }
}

@immutable
final class IssuesAddLabelsRequestList2 extends IssuesAddLabelsRequest {
  const IssuesAddLabelsRequestList2(this.value);

  final List<IssuesAddLabelsRequestOneOf3Inner> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesAddLabelsRequestList2 && value == other.value;
  }
}

@immutable
final class IssuesAddLabelsRequestString extends IssuesAddLabelsRequest {
  const IssuesAddLabelsRequestString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesAddLabelsRequestString && value == other.value;
  }
}

@immutable
final class IssuesAddLabelsRequestOneOf0 extends IssuesAddLabelsRequest {
  const IssuesAddLabelsRequestOneOf0({this.labels});

  /// Converts a `Map<String, dynamic>` to an [IssuesAddLabelsRequestOneOf0].
  factory IssuesAddLabelsRequestOneOf0.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesAddLabelsRequestOneOf0',
      json,
      () => IssuesAddLabelsRequestOneOf0(
        labels: (json['labels'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesAddLabelsRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesAddLabelsRequestOneOf0.fromJson(json);
  }

  /// The names of the labels to add to the issue's existing labels. You can
  /// pass an empty array to remove all labels. Alternatively, you can pass a
  /// single label as a `string` or an `array` of labels directly, but GitHub
  /// recommends passing an object with the `labels` key. You can also replace
  /// all of the labels for an issue. For more information, see "[Set labels
  /// for an
  /// issue](https://docs.github.com/rest/issues/labels#set-labels-for-an-issue)."
  final List<String>? labels;

  /// Converts an [IssuesAddLabelsRequestOneOf0] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'labels': ?labels};
  }

  @override
  int get hashCode => listHash(labels).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesAddLabelsRequestOneOf0 &&
        listsEqual(labels, other.labels);
  }
}

@immutable
final class IssuesAddLabelsRequestOneOf2 extends IssuesAddLabelsRequest {
  const IssuesAddLabelsRequestOneOf2({this.labels});

  /// Converts a `Map<String, dynamic>` to an [IssuesAddLabelsRequestOneOf2].
  factory IssuesAddLabelsRequestOneOf2.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesAddLabelsRequestOneOf2',
      json,
      () => IssuesAddLabelsRequestOneOf2(
        labels: (json['labels'] as List?)
            ?.map<IssuesAddLabelsRequestOneOf2LabelsInner>(
              (e) => IssuesAddLabelsRequestOneOf2LabelsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesAddLabelsRequestOneOf2? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesAddLabelsRequestOneOf2.fromJson(json);
  }

  final List<IssuesAddLabelsRequestOneOf2LabelsInner>? labels;

  /// Converts an [IssuesAddLabelsRequestOneOf2] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'labels': ?labels?.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(labels).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesAddLabelsRequestOneOf2 &&
        listsEqual(labels, other.labels);
  }
}
