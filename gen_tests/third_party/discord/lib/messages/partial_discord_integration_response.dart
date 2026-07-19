import 'package:discord/messages/account_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/integration_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class PartialDiscordIntegrationResponse {
  const PartialDiscordIntegrationResponse({
    required this.id,
    required this.name,
    required this.account,
    required this.applicationId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [PartialDiscordIntegrationResponse].
  factory PartialDiscordIntegrationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PartialDiscordIntegrationResponse',
      json,
      () => PartialDiscordIntegrationResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: checkedKey(json, 'name') as String?,
        account: AccountResponse.fromJson(
          json['account'] as Map<String, dynamic>,
        ),
        applicationId: SnowflakeType.fromJson(json['application_id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PartialDiscordIntegrationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PartialDiscordIntegrationResponse.fromJson(json);
  }

  final SnowflakeType id;
  IntegrationTypes get type => IntegrationTypes.discord;
  final String? name;
  final AccountResponse account;
  final SnowflakeType applicationId;

  /// Converts a [PartialDiscordIntegrationResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'type': type.toJson(),
      'name': name,
      'account': account.toJson(),
      'application_id': applicationId.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, account, applicationId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PartialDiscordIntegrationResponse &&
        id == other.id &&
        name == other.name &&
        account == other.account &&
        applicationId == other.applicationId;
  }
}
