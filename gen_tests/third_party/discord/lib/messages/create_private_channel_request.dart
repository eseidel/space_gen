import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class CreatePrivateChannelRequest {
  CreatePrivateChannelRequest({
    this.recipientId,
    this.accessTokens,
    this.nicks,
  }) {
    accessTokens?.validate(maxItems: 1521, unique: true);
    nicks?.validate(maxProperties: 1521);
  }

  /// Converts a `Map<String, dynamic>` to a [CreatePrivateChannelRequest].
  factory CreatePrivateChannelRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreatePrivateChannelRequest',
      json,
      () => CreatePrivateChannelRequest(
        recipientId: SnowflakeType.maybeFromJson(
          json['recipient_id'] as String?,
        ),
        accessTokens: (json['access_tokens'] as List?)?.cast<String>(),
        nicks: (json['nicks'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreatePrivateChannelRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreatePrivateChannelRequest.fromJson(json);
  }

  final SnowflakeType? recipientId;
  final List<String>? accessTokens;
  final Map<String, String>? nicks;

  /// Converts a [CreatePrivateChannelRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'recipient_id': recipientId?.toJson(),
      'access_tokens': accessTokens,
      'nicks': nicks,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([recipientId, listHash(accessTokens), mapHash(nicks)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreatePrivateChannelRequest &&
        recipientId == other.recipientId &&
        listsEqual(accessTokens, other.accessTokens) &&
        mapsEqual(nicks, other.nicks);
  }
}
