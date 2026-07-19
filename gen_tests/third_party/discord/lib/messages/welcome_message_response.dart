import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class WelcomeMessageResponse {
  const WelcomeMessageResponse({
    required this.authorIds,
    required this.message,
  });

  /// Converts a `Map<String, dynamic>` to a [WelcomeMessageResponse].
  factory WelcomeMessageResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WelcomeMessageResponse',
      json,
      () => WelcomeMessageResponse(
        authorIds: (json['author_ids'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        message: json['message'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WelcomeMessageResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WelcomeMessageResponse.fromJson(json);
  }

  final List<SnowflakeType> authorIds;
  final String message;

  /// Converts a [WelcomeMessageResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'author_ids': authorIds.map((e) => e.toJson()).toList(),
      'message': message,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(authorIds), message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WelcomeMessageResponse &&
        listsEqual(authorIds, other.authorIds) &&
        message == other.message;
  }
}
