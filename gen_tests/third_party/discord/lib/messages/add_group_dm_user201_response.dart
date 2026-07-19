import 'package:discord/messages/private_channel_response.dart';
import 'package:discord/messages/private_group_channel_response.dart';
import 'package:meta/meta.dart';

sealed class AddGroupDmUser201Response {
  const AddGroupDmUser201Response();

  factory AddGroupDmUser201Response.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => AddGroupDmUser201ResponsePrivateChannelResponse(
        PrivateChannelResponse.fromJson(json),
      ),
      3 => AddGroupDmUser201ResponsePrivateGroupChannelResponse(
        PrivateGroupChannelResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for AddGroupDmUser201Response",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AddGroupDmUser201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AddGroupDmUser201Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class AddGroupDmUser201ResponsePrivateChannelResponse
    extends AddGroupDmUser201Response {
  const AddGroupDmUser201ResponsePrivateChannelResponse(this.value);

  final PrivateChannelResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddGroupDmUser201ResponsePrivateChannelResponse &&
        value == other.value;
  }
}

@immutable
final class AddGroupDmUser201ResponsePrivateGroupChannelResponse
    extends AddGroupDmUser201Response {
  const AddGroupDmUser201ResponsePrivateGroupChannelResponse(this.value);

  final PrivateGroupChannelResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AddGroupDmUser201ResponsePrivateGroupChannelResponse &&
        value == other.value;
  }
}
