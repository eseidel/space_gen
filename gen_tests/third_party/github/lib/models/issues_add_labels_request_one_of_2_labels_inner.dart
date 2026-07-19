import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesAddLabelsRequestOneOf2LabelsInner {
  const IssuesAddLabelsRequestOneOf2LabelsInner({required this.name});

  /// Converts a `Map<String, dynamic>` to an
  /// [IssuesAddLabelsRequestOneOf2LabelsInner].
  factory IssuesAddLabelsRequestOneOf2LabelsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IssuesAddLabelsRequestOneOf2LabelsInner',
      json,
      () =>
          IssuesAddLabelsRequestOneOf2LabelsInner(name: json['name'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesAddLabelsRequestOneOf2LabelsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesAddLabelsRequestOneOf2LabelsInner.fromJson(json);
  }

  final String name;

  /// Converts an [IssuesAddLabelsRequestOneOf2LabelsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesAddLabelsRequestOneOf2LabelsInner &&
        name == other.name;
  }
}
