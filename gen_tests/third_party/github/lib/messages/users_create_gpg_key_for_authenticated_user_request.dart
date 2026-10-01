// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UsersCreateGpgKeyForAuthenticatedUserRequest {
  const UsersCreateGpgKeyForAuthenticatedUserRequest({
    required this.armoredPublicKey,
    this.name,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UsersCreateGpgKeyForAuthenticatedUserRequest].
  factory UsersCreateGpgKeyForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UsersCreateGpgKeyForAuthenticatedUserRequest',
      json,
      () => UsersCreateGpgKeyForAuthenticatedUserRequest(
        name: json['name'] as String?,
        armoredPublicKey: json['armored_public_key'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersCreateGpgKeyForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersCreateGpgKeyForAuthenticatedUserRequest.fromJson(json);
  }

  /// A descriptive name for the new key.
  final String? name;

  /// A GPG key in ASCII-armored format.
  final String armoredPublicKey;

  /// Converts a [UsersCreateGpgKeyForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': ?name, 'armored_public_key': armoredPublicKey};
  }

  @override
  int get hashCode => Object.hashAll([name, armoredPublicKey]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersCreateGpgKeyForAuthenticatedUserRequest &&
        name == other.name &&
        armoredPublicKey == other.armoredPublicKey;
  }
}
