import 'package:discord/messages/account_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/integration_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class PartialGuildSubscriptionIntegrationResponse {
  const PartialGuildSubscriptionIntegrationResponse({
    required this.id,
    required this.name,
    required this.account,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [PartialGuildSubscriptionIntegrationResponse].
  factory PartialGuildSubscriptionIntegrationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PartialGuildSubscriptionIntegrationResponse',
      json,
      () => PartialGuildSubscriptionIntegrationResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: checkedKey(json, 'name') as String?,
        account: AccountResponse.fromJson(
          json['account'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PartialGuildSubscriptionIntegrationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PartialGuildSubscriptionIntegrationResponse.fromJson(json);
  }

  final SnowflakeType id;
  IntegrationTypes get type => IntegrationTypes.guildSubscription;
  final String? name;
  final AccountResponse account;

  /// Converts a [PartialGuildSubscriptionIntegrationResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'name': name,
      'account': account.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, account]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PartialGuildSubscriptionIntegrationResponse &&
        id == other.id &&
        name == other.name &&
        account == other.account;
  }
}
