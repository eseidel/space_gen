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
  final bool? private;

  /// Converts a [CodespacesPublishForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'private': private};
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
