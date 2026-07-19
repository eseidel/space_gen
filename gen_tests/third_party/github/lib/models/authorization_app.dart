import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class AuthorizationApp {
  const AuthorizationApp({
    required this.clientId,
    required this.name,
    required this.url,
  });

  /// Converts a `Map<String, dynamic>` to an [AuthorizationApp].
  factory AuthorizationApp.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AuthorizationApp',
      json,
      () => AuthorizationApp(
        clientId: json['client_id'] as String,
        name: json['name'] as String,
        url: Uri.parse(json['url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AuthorizationApp? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AuthorizationApp.fromJson(json);
  }

  final String clientId;
  final String name;
  final Uri url;

  /// Converts an [AuthorizationApp] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'client_id': clientId, 'name': name, 'url': url.toString()};
  }

  @override
  int get hashCode => Object.hashAll([clientId, name, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthorizationApp &&
        clientId == other.clientId &&
        name == other.name &&
        url == other.url;
  }
}
