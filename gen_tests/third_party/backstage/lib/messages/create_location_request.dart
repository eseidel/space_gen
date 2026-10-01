// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CreateLocationRequest {
  const CreateLocationRequest({required this.target, required this.type});

  /// Converts a `Map<String, dynamic>` to a [CreateLocationRequest].
  factory CreateLocationRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateLocationRequest',
      json,
      () => CreateLocationRequest(
        target: json['target'] as String,
        type: json['type'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateLocationRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateLocationRequest.fromJson(json);
  }

  final String target;
  final String type;

  /// Converts a [CreateLocationRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'target': target, 'type': type};
  }

  @override
  int get hashCode => Object.hashAll([target, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateLocationRequest &&
        target == other.target &&
        type == other.type;
  }
}
