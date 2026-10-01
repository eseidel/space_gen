// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesSetLabelsRequestOneOf3Inner {
  const IssuesSetLabelsRequestOneOf3Inner({required this.name});

  /// Converts a `Map<String, dynamic>` to an
  /// [IssuesSetLabelsRequestOneOf3Inner].
  factory IssuesSetLabelsRequestOneOf3Inner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IssuesSetLabelsRequestOneOf3Inner',
      json,
      () => IssuesSetLabelsRequestOneOf3Inner(name: json['name'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesSetLabelsRequestOneOf3Inner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesSetLabelsRequestOneOf3Inner.fromJson(json);
  }

  final String name;

  /// Converts an [IssuesSetLabelsRequestOneOf3Inner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesSetLabelsRequestOneOf3Inner && name == other.name;
  }
}
