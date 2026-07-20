import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BotPartnerSdkUnmergeProvisionalAccountRequest {
  BotPartnerSdkUnmergeProvisionalAccountRequest({
    required this.externalUserId,
  }) {
    externalUserId.validate(maxLength: 1024);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [BotPartnerSdkUnmergeProvisionalAccountRequest].
  factory BotPartnerSdkUnmergeProvisionalAccountRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BotPartnerSdkUnmergeProvisionalAccountRequest',
      json,
      () => BotPartnerSdkUnmergeProvisionalAccountRequest(
        externalUserId: json['external_user_id'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BotPartnerSdkUnmergeProvisionalAccountRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BotPartnerSdkUnmergeProvisionalAccountRequest.fromJson(json);
  }

  final String externalUserId;

  /// Converts a [BotPartnerSdkUnmergeProvisionalAccountRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'external_user_id': externalUserId};
  }

  @override
  int get hashCode => externalUserId.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BotPartnerSdkUnmergeProvisionalAccountRequest &&
        externalUserId == other.externalUserId;
  }
}
