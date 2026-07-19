import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsConvertMemberToOutsideCollaboratorRequest {
  const OrgsConvertMemberToOutsideCollaboratorRequest({this.async_ = false});

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsConvertMemberToOutsideCollaboratorRequest].
  factory OrgsConvertMemberToOutsideCollaboratorRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsConvertMemberToOutsideCollaboratorRequest',
      json,
      () => OrgsConvertMemberToOutsideCollaboratorRequest(
        async_: (json['async'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsConvertMemberToOutsideCollaboratorRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsConvertMemberToOutsideCollaboratorRequest.fromJson(json);
  }

  /// When set to `true`, the request will be performed asynchronously.
  /// Returns a 202 status code when the job is successfully queued.
  final bool async_;

  /// Converts an [OrgsConvertMemberToOutsideCollaboratorRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'async': async_};
  }

  @override
  int get hashCode => async_.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsConvertMemberToOutsideCollaboratorRequest &&
        async_ == other.async_;
  }
}
