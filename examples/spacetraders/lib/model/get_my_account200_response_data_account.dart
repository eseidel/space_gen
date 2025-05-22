class GetMyAccount200ResponseDataAccount {
  GetMyAccount200ResponseDataAccount({
    required this.id,
    required this.email,
    required this.token,
    required this.createdAt,
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

  final String id;
  final String email;
  final String token;
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'token': token,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
