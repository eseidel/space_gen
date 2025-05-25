import 'package:meta/meta.dart';

@immutable
class GetMyAccount200ResponseDataAccount {
  const GetMyAccount200ResponseDataAccount({
    required this.id,
    required this.email,
    required this.createdAt,
    this.token,
  });

  factory GetMyAccount200ResponseDataAccount.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetMyAccount200ResponseDataAccount(
      id: json['id'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyAccount200ResponseDataAccount? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetMyAccount200ResponseDataAccount.fromJson(json);
  }

  final String id;
  final String email;
  final String? token;
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'token': token,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hash(id, email, token, createdAt);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyAccount200ResponseDataAccount &&
        id == other.id &&
        email == other.email &&
        token == other.token &&
        createdAt == other.createdAt;
  }
}
