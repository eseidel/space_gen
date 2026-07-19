import 'package:discord/model_helpers.dart';
import 'package:discord/models/thread_auto_archive_duration.dart';
import 'package:meta/meta.dart';

@immutable
class CreateTextThreadWithMessageRequest {
  const CreateTextThreadWithMessageRequest({
    required this.name,
    this.autoArchiveDuration,
    this.rateLimitPerUser,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CreateTextThreadWithMessageRequest].
  factory CreateTextThreadWithMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CreateTextThreadWithMessageRequest',
      json,
      () => CreateTextThreadWithMessageRequest(
        name: json['name'] as String,
        autoArchiveDuration: ThreadAutoArchiveDuration.maybeFromJson(
          json['auto_archive_duration'] as int?,
        ),
        rateLimitPerUser: json['rate_limit_per_user'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateTextThreadWithMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateTextThreadWithMessageRequest.fromJson(json);
  }

  final String name;
  final ThreadAutoArchiveDuration? autoArchiveDuration;
  final int? rateLimitPerUser;

  /// Converts a [CreateTextThreadWithMessageRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'auto_archive_duration': autoArchiveDuration?.toJson(),
      'rate_limit_per_user': rateLimitPerUser,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, autoArchiveDuration, rateLimitPerUser]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateTextThreadWithMessageRequest &&
        name == other.name &&
        autoArchiveDuration == other.autoArchiveDuration &&
        rateLimitPerUser == other.rateLimitPerUser;
  }
}
