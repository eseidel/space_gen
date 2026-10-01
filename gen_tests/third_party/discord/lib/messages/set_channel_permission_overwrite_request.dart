// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_permission_overwrites.dart';
import 'package:meta/meta.dart';

@immutable
class SetChannelPermissionOverwriteRequest {
  const SetChannelPermissionOverwriteRequest({
    this.type,
    this.allow,
    this.deny,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SetChannelPermissionOverwriteRequest].
  factory SetChannelPermissionOverwriteRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SetChannelPermissionOverwriteRequest',
      json,
      () => SetChannelPermissionOverwriteRequest(
        type: ChannelPermissionOverwrites.maybeFromJson(json['type'] as int?),
        allow: json['allow'] as int?,
        deny: json['deny'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SetChannelPermissionOverwriteRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SetChannelPermissionOverwriteRequest.fromJson(json);
  }

  final ChannelPermissionOverwrites? type;
  final int? allow;
  final int? deny;

  /// Converts a [SetChannelPermissionOverwriteRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type?.toJson(), 'allow': allow, 'deny': deny};
  }

  @override
  int get hashCode => Object.hashAll([type, allow, deny]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SetChannelPermissionOverwriteRequest &&
        type == other.type &&
        allow == other.allow &&
        deny == other.deny;
  }
}
