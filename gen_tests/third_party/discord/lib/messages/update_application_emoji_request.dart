import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateApplicationEmojiRequest {
  const UpdateApplicationEmojiRequest({this.name});

  /// Converts a `Map<String, dynamic>` to a [UpdateApplicationEmojiRequest].
  factory UpdateApplicationEmojiRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateApplicationEmojiRequest',
      json,
      () => UpdateApplicationEmojiRequest(name: json['name'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateApplicationEmojiRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateApplicationEmojiRequest.fromJson(json);
  }

  final String? name;

  /// Converts a [UpdateApplicationEmojiRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': ?name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateApplicationEmojiRequest && name == other.name;
  }
}
