// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesPublishForAuthenticatedUserRequest {
  const CodespacesPublishForAuthenticatedUserRequest({
    this.name,
    this.private = false,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesPublishForAuthenticatedUserRequest].
  factory CodespacesPublishForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesPublishForAuthenticatedUserRequest',
      json,
      () => CodespacesPublishForAuthenticatedUserRequest(
        name: json['name'] as String?,
        private: (json['private'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesPublishForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesPublishForAuthenticatedUserRequest.fromJson(json);
  }

  /// A name for the new repository.
  final String? name;

  /// Whether the new repository should be private.
  final bool private;

  /// Converts a [CodespacesPublishForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': ?name, 'private': private};
  }

  @override
  int get hashCode => Object.hashAll([name, private]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesPublishForAuthenticatedUserRequest &&
        name == other.name &&
        private == other.private;
  }
}
