import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template marketplace_account}
/// Marketplace Account
/// {@endtemplate}
@immutable
class MarketplaceAccount {
  /// {@macro marketplace_account}
  const MarketplaceAccount({
    required this.url,
    required this.id,
    required this.type,
    required this.login,
    this.nodeId,
    this.email,
    this.organizationBillingEmail,
  });

  /// Converts a `Map<String, dynamic>` to a [MarketplaceAccount].
  factory MarketplaceAccount.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MarketplaceAccount',
      json,
      () => MarketplaceAccount(
        url: Uri.parse(json['url'] as String),
        id: json['id'] as int,
        type: json['type'] as String,
        nodeId: json['node_id'] as String?,
        login: json['login'] as String,
        email: json['email'] as String?,
        organizationBillingEmail: json['organization_billing_email'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MarketplaceAccount? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MarketplaceAccount.fromJson(json);
  }

  final Uri url;
  final int id;
  final String type;
  final String? nodeId;
  final String login;
  final String? email;
  final String? organizationBillingEmail;

  /// Converts a [MarketplaceAccount] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'id': id,
      'type': type,
      if (nodeId != null) 'node_id': nodeId,
      'login': login,
      'email': email,
      'organization_billing_email': organizationBillingEmail,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    id,
    type,
    nodeId,
    login,
    email,
    organizationBillingEmail,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MarketplaceAccount &&
        url == other.url &&
        id == other.id &&
        type == other.type &&
        nodeId == other.nodeId &&
        login == other.login &&
        email == other.email &&
        organizationBillingEmail == other.organizationBillingEmail;
  }
}
