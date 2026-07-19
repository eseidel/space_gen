import 'package:discord/messages/account_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/integration_types.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class PartialExternalConnectionIntegrationResponse {
  const PartialExternalConnectionIntegrationResponse({
    required this.id,
    required this.type,
    required this.name,
    required this.account,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [PartialExternalConnectionIntegrationResponse].
  factory PartialExternalConnectionIntegrationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PartialExternalConnectionIntegrationResponse',
      json,
      () => PartialExternalConnectionIntegrationResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        type: IntegrationTypes.fromJson(json['type'] as String),
        name: checkedKey(json, 'name') as String?,
        account: AccountResponse.fromJson(
          json['account'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PartialExternalConnectionIntegrationResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PartialExternalConnectionIntegrationResponse.fromJson(json);
  }

  final SnowflakeType id;
  final IntegrationTypes type;
  final String? name;
  final AccountResponse account;

  /// Converts a [PartialExternalConnectionIntegrationResponse]
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
  int get hashCode => Object.hashAll([id, type, name, account]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PartialExternalConnectionIntegrationResponse &&
        id == other.id &&
        type == other.type &&
        name == other.name &&
        account == other.account;
  }
}
