// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class InviteChannelRecipientResponse {
  const InviteChannelRecipientResponse({required this.username});

  /// Converts a `Map<String, dynamic>` to an [InviteChannelRecipientResponse].
  factory InviteChannelRecipientResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InviteChannelRecipientResponse',
      json,
      () =>
          InviteChannelRecipientResponse(username: json['username'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InviteChannelRecipientResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return InviteChannelRecipientResponse.fromJson(json);
  }

  final String username;

  /// Converts an [InviteChannelRecipientResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'username': username};
  }

  @override
  int get hashCode => username.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InviteChannelRecipientResponse &&
        username == other.username;
  }
}
