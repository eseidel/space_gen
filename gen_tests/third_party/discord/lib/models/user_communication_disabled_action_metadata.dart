// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UserCommunicationDisabledActionMetadata {
  UserCommunicationDisabledActionMetadata({this.durationSeconds}) {
    durationSeconds?.validate(min: 0, max: 2419200);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [UserCommunicationDisabledActionMetadata].
  factory UserCommunicationDisabledActionMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UserCommunicationDisabledActionMetadata',
      json,
      () => UserCommunicationDisabledActionMetadata(
        durationSeconds: json['duration_seconds'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserCommunicationDisabledActionMetadata? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UserCommunicationDisabledActionMetadata.fromJson(json);
  }

  final int? durationSeconds;

  /// Converts a [UserCommunicationDisabledActionMetadata]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'duration_seconds': durationSeconds};
  }

  @override
  int get hashCode => durationSeconds.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserCommunicationDisabledActionMetadata &&
        durationSeconds == other.durationSeconds;
  }
}
