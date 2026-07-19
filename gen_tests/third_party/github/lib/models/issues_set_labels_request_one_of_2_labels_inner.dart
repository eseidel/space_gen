import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesSetLabelsRequestOneOf2LabelsInner {
  const IssuesSetLabelsRequestOneOf2LabelsInner({required this.name});

  /// Converts a `Map<String, dynamic>` to an
  /// [IssuesSetLabelsRequestOneOf2LabelsInner].
  factory IssuesSetLabelsRequestOneOf2LabelsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IssuesSetLabelsRequestOneOf2LabelsInner',
      json,
      () =>
          IssuesSetLabelsRequestOneOf2LabelsInner(name: json['name'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesSetLabelsRequestOneOf2LabelsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesSetLabelsRequestOneOf2LabelsInner.fromJson(json);
  }

  final String name;

  /// Converts an [IssuesSetLabelsRequestOneOf2LabelsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesSetLabelsRequestOneOf2LabelsInner &&
        name == other.name;
  }
}
