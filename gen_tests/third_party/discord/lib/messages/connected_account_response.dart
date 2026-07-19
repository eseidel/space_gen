import 'package:discord/messages/connected_account_integration_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/connected_account_providers.dart';
import 'package:discord/models/connected_account_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class ConnectedAccountResponse {
  const ConnectedAccountResponse({
    required this.id,
    required this.name,
    required this.type,
    required this.friendSync,
    required this.showActivity,
    required this.twoWayLink,
    required this.verified,
    required this.visibility,
    this.integrations,
    this.revoked,
  });

  /// Converts a `Map<String, dynamic>` to a [ConnectedAccountResponse].
  factory ConnectedAccountResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ConnectedAccountResponse',
      json,
      () => ConnectedAccountResponse(
        id: json['id'] as String,
        name: checkedKey(json, 'name') as String?,
        type: ConnectedAccountProviders.fromJson(json['type'] as String),
        friendSync: json['friend_sync'] as bool,
        integrations: (json['integrations'] as List?)
            ?.map<ConnectedAccountIntegrationResponse>(
              (e) => ConnectedAccountIntegrationResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        showActivity: json['show_activity'] as bool,
        twoWayLink: json['two_way_link'] as bool,
        verified: json['verified'] as bool,
        visibility: ConnectedAccountVisibility.fromJson(
          json['visibility'] as int,
        ),
        revoked: json['revoked'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ConnectedAccountResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ConnectedAccountResponse.fromJson(json);
  }

  final String id;
  final String? name;
  final ConnectedAccountProviders type;
  final bool friendSync;
  final List<ConnectedAccountIntegrationResponse>? integrations;
  final bool showActivity;
  final bool twoWayLink;
  final bool verified;
  final ConnectedAccountVisibility visibility;
  final bool? revoked;

  /// Converts a [ConnectedAccountResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.toJson(),
      'friend_sync': friendSync,
      'integrations': ?integrations?.map((e) => e.toJson()).toList(),
      'show_activity': showActivity,
      'two_way_link': twoWayLink,
      'verified': verified,
      'visibility': visibility.toJson(),
      'revoked': ?revoked,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    type,
    friendSync,
    listHash(integrations),
    showActivity,
    twoWayLink,
    verified,
    visibility,
    revoked,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConnectedAccountResponse &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        friendSync == other.friendSync &&
        listsEqual(integrations, other.integrations) &&
        showActivity == other.showActivity &&
        twoWayLink == other.twoWayLink &&
        verified == other.verified &&
        visibility == other.visibility &&
        revoked == other.revoked;
  }
}
