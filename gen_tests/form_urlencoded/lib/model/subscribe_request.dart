import 'package:form_urlencoded/model_helpers.dart';

class SubscribeRequest {
  SubscribeRequest({required this.email, this.topic});

  /// Converts a `Map<String, dynamic>` to a [SubscribeRequest].
  factory SubscribeRequest.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'SubscribeRequest',
      json,
      () => SubscribeRequest(
        email: json['email'] as String,
        topic: json['topic'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SubscribeRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SubscribeRequest.fromJson(json);
  }

  String email;
  String? topic;

  /// Converts a [SubscribeRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'email': email, 'topic': ?topic};
  }

  @override
  int get hashCode => Object.hashAll([email, topic]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SubscribeRequest &&
        email == other.email &&
        topic == other.topic;
  }
}
