import 'package:discord/model_helpers.dart';
import 'package:discord/models/activity_action_types.dart';
import 'package:meta/meta.dart';

@immutable
class MessageActivityResponse {
  const MessageActivityResponse({required this.type, this.partyId});

  /// Converts a `Map<String, dynamic>` to a [MessageActivityResponse].
  factory MessageActivityResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageActivityResponse',
      json,
      () => MessageActivityResponse(
        type: ActivityActionTypes.fromJson(json['type'] as int),
        partyId: json['party_id'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageActivityResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageActivityResponse.fromJson(json);
  }

  final ActivityActionTypes type;
  final String? partyId;

  /// Converts a [MessageActivityResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'party_id': partyId};
  }

  @override
  int get hashCode => Object.hashAll([type, partyId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageActivityResponse &&
        type == other.type &&
        partyId == other.partyId;
  }
}
