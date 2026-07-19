import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BanUserFromGuildRequest {
  const BanUserFromGuildRequest({
    this.deleteMessageSeconds,
    this.deleteMessageDays,
  });

  /// Converts a `Map<String, dynamic>` to a [BanUserFromGuildRequest].
  factory BanUserFromGuildRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BanUserFromGuildRequest',
      json,
      () => BanUserFromGuildRequest(
        deleteMessageSeconds: json['delete_message_seconds'] as int?,
        deleteMessageDays: json['delete_message_days'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BanUserFromGuildRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BanUserFromGuildRequest.fromJson(json);
  }

  final int? deleteMessageSeconds;
  final int? deleteMessageDays;

  /// Converts a [BanUserFromGuildRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'delete_message_seconds': deleteMessageSeconds,
      'delete_message_days': deleteMessageDays,
    };
  }

  @override
  int get hashCode => Object.hashAll([deleteMessageSeconds, deleteMessageDays]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BanUserFromGuildRequest &&
        deleteMessageSeconds == other.deleteMessageSeconds &&
        deleteMessageDays == other.deleteMessageDays;
  }
}
