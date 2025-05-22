class GetMyAccount200Response {
  GetMyAccount200Response({required this.data});

  factory GetMyAccount200Response.fromJson(Map<String, dynamic> json) {
    return GetMyAccount200Response(
      data: GetMyAccount200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final GetMyAccount200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class GetMyAccount200ResponseData {
  GetMyAccount200ResponseData({required this.account});

  factory GetMyAccount200ResponseData.fromJson(Map<String, dynamic> json) {
    return GetMyAccount200ResponseData(
      account: GetMyAccount200ResponseDataAccount.fromJson(
        json['account'] as Map<String, dynamic>,
      ),
    );
  }

  final GetMyAccount200ResponseDataAccount account;

  Map<String, dynamic> toJson() {
    return {'account': account.toJson()};
  }
}

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
