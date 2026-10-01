// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CheckRunCheckSuite {
  const CheckRunCheckSuite({required this.id});

  /// Converts a `Map<String, dynamic>` to a [CheckRunCheckSuite].
  factory CheckRunCheckSuite.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CheckRunCheckSuite',
      json,
      () => CheckRunCheckSuite(id: json['id'] as int),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CheckRunCheckSuite? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CheckRunCheckSuite.fromJson(json);
  }

  final int id;

  /// Converts a [CheckRunCheckSuite] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckRunCheckSuite && id == other.id;
  }
}
