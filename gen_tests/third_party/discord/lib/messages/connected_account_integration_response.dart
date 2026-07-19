import 'package:discord/messages/account_response.dart';
import 'package:discord/messages/connected_account_guild_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/integration_types.dart';
import 'package:meta/meta.dart';

@immutable
class ConnectedAccountIntegrationResponse {
  const ConnectedAccountIntegrationResponse({
    required this.id,
    required this.type,
    required this.account,
    required this.guild,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ConnectedAccountIntegrationResponse].
  factory ConnectedAccountIntegrationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ConnectedAccountIntegrationResponse',
      json,
      () => ConnectedAccountIntegrationResponse(
        id: json['id'] as String,
        type: IntegrationTypes.fromJson(json['type'] as String),
        account: AccountResponse.fromJson(
          json['account'] as Map<String, dynamic>,
        ),
        guild: ConnectedAccountGuildResponse.fromJson(
          json['guild'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ConnectedAccountIntegrationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ConnectedAccountIntegrationResponse.fromJson(json);
  }

  final String id;
  final IntegrationTypes type;
  final AccountResponse account;
  final ConnectedAccountGuildResponse guild;

  /// Converts a [ConnectedAccountIntegrationResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toJson(),
      'account': account.toJson(),
      'guild': guild.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, type, account, guild]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConnectedAccountIntegrationResponse &&
        id == other.id &&
        type == other.type &&
        account == other.account &&
        guild == other.guild;
  }
}
