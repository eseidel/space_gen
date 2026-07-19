import 'package:form_urlencoded/model_helpers.dart';

class CreateSessionRequest {
  CreateSessionRequest({
    required this.userId,
    required this.password,
    this.remember,
    this.attempts,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateSessionRequest].
  factory CreateSessionRequest.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'CreateSessionRequest',
      json,
      () => CreateSessionRequest(
        userId: json['user_id'] as String,
        password: json['password'] as String,
        remember: json['remember'] as bool?,
        attempts: json['attempts'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateSessionRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateSessionRequest.fromJson(json);
  }

  String userId;
  String password;
  bool? remember;
  int? attempts;

  /// Converts a [CreateSessionRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'password': password,
      'remember': ?remember,
      'attempts': ?attempts,
    };
  }

  @override
  int get hashCode => Object.hashAll([userId, password, remember, attempts]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateSessionRequest &&
        userId == other.userId &&
        password == other.password &&
        remember == other.remember &&
        attempts == other.attempts;
  }
}
