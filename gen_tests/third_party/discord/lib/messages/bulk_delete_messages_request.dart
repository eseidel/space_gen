import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class BulkDeleteMessagesRequest {
  BulkDeleteMessagesRequest({required this.messages}) {
    messages.validate(minItems: 2, maxItems: 100, unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [BulkDeleteMessagesRequest].
  factory BulkDeleteMessagesRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BulkDeleteMessagesRequest',
      json,
      () => BulkDeleteMessagesRequest(
        messages: (json['messages'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BulkDeleteMessagesRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BulkDeleteMessagesRequest.fromJson(json);
  }

  final List<SnowflakeType> messages;

  /// Converts a [BulkDeleteMessagesRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'messages': messages.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(messages).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BulkDeleteMessagesRequest &&
        listsEqual(messages, other.messages);
  }
}
