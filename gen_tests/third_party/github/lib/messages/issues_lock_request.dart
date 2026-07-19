import 'package:github/model_helpers.dart';
import 'package:github/models/issues_lock_request_lock_reason.dart';
import 'package:meta/meta.dart';

@immutable
class IssuesLockRequest {
  const IssuesLockRequest({this.lockReason});

  /// Converts a `Map<String, dynamic>` to an [IssuesLockRequest].
  factory IssuesLockRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssuesLockRequest',
      json,
      () => IssuesLockRequest(
        lockReason: IssuesLockRequestLockReason.maybeFromJson(
          json['lock_reason'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesLockRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssuesLockRequest.fromJson(json);
  }

  /// The reason for locking the issue or pull request conversation. Lock will
  /// fail if you don't use one of these reasons:
  ///  * `off-topic`
  ///  * `too heated`
  ///  * `resolved`
  ///  * `spam`
  final IssuesLockRequestLockReason? lockReason;

  /// Converts an [IssuesLockRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (lockReason != null) 'lock_reason': lockReason?.toJson()};
  }

  @override
  int get hashCode => lockReason.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesLockRequest && lockReason == other.lockReason;
  }
}
