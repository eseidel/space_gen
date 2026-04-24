import 'package:security/model_helpers.dart';

class User {
  User({
    required this.id,
  });

  /// Converts a `Map<String, dynamic>` to a [User].
  factory User.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'User',
      json,
      () => User(
        id: json['id'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static User? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return User.fromJson(json);
  }

  String id;

  /// Converts a [User] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && id == other.id;
  }
}
