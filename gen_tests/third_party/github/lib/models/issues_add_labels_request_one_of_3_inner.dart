import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesAddLabelsRequestOneOf3Inner {
  const IssuesAddLabelsRequestOneOf3Inner({required this.name});

  /// Converts a `Map<String, dynamic>` to an
  /// [IssuesAddLabelsRequestOneOf3Inner].
  factory IssuesAddLabelsRequestOneOf3Inner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IssuesAddLabelsRequestOneOf3Inner',
      json,
      () => IssuesAddLabelsRequestOneOf3Inner(name: json['name'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesAddLabelsRequestOneOf3Inner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesAddLabelsRequestOneOf3Inner.fromJson(json);
  }

  final String name;

  /// Converts an [IssuesAddLabelsRequestOneOf3Inner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesAddLabelsRequestOneOf3Inner && name == other.name;
  }
}
