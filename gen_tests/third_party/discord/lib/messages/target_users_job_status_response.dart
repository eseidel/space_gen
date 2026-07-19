import 'package:discord/model_helpers.dart';
import 'package:discord/models/target_users_job_status_types.dart';
import 'package:discord/models/u_int32_type.dart';
import 'package:meta/meta.dart';

@immutable
class TargetUsersJobStatusResponse {
  const TargetUsersJobStatusResponse({
    required this.status,
    required this.totalUsers,
    required this.processedUsers,
    required this.createdAt,
    required this.completedAt,
    required this.errorMessage,
  });

  /// Converts a `Map<String, dynamic>` to a [TargetUsersJobStatusResponse].
  factory TargetUsersJobStatusResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TargetUsersJobStatusResponse',
      json,
      () => TargetUsersJobStatusResponse(
        status: TargetUsersJobStatusTypes.fromJson(json['status'] as int),
        totalUsers: UInt32Type.fromJson(json['total_users'] as int),
        processedUsers: UInt32Type.fromJson(json['processed_users'] as int),
        createdAt: maybeParseDateTime(
          checkedKey(json, 'created_at') as String?,
        ),
        completedAt: maybeParseDateTime(
          checkedKey(json, 'completed_at') as String?,
        ),
        errorMessage: checkedKey(json, 'error_message') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TargetUsersJobStatusResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TargetUsersJobStatusResponse.fromJson(json);
  }

  final TargetUsersJobStatusTypes status;
  final UInt32Type totalUsers;
  final UInt32Type processedUsers;

  /// The timestamp when the job was created.
  final DateTime? createdAt;

  /// The timestamp when the job was successfully completed.
  final DateTime? completedAt;

  /// The error message if the job failed.
  final String? errorMessage;

  /// Converts a [TargetUsersJobStatusResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'status': status.toJson(),
      'total_users': totalUsers.toJson(),
      'processed_users': processedUsers.toJson(),
      'created_at': createdAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'error_message': errorMessage,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    status,
    totalUsers,
    processedUsers,
    createdAt,
    completedAt,
    errorMessage,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TargetUsersJobStatusResponse &&
        status == other.status &&
        totalUsers == other.totalUsers &&
        processedUsers == other.processedUsers &&
        createdAt == other.createdAt &&
        completedAt == other.completedAt &&
        errorMessage == other.errorMessage;
  }
}
