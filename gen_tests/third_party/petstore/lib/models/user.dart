import 'package:meta/meta.dart';
import 'package:petstore/model_helpers.dart';

@immutable
class User {
  const User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.userStatus,
  });

  /// Converts a `Map<String, dynamic>` to a [User].
  factory User.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'User',
      json,
      () => User(
        id: json['id'] as int?,
        username: json['username'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        phone: json['phone'] as String?,
        userStatus: json['userStatus'] as int?,
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

  /// Example: `10`
  final int? id;

  /// Example: `'theUser'`
  final String? username;

  /// Example: `'John'`
  final String? firstName;

  /// Example: `'James'`
  final String? lastName;

  /// Example: `'john@email.com'`
  final String? email;

  /// Example: `'12345'`
  final String? password;

  /// Example: `'12345'`
  final String? phone;

  /// User Status
  /// Example: `1`
  final int? userStatus;

  /// Converts a [User] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phone': phone,
      'userStatus': userStatus,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    username,
    firstName,
    lastName,
    email,
    password,
    phone,
    userStatus,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        id == other.id &&
        username == other.username &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        password == other.password &&
        phone == other.phone &&
        userStatus == other.userStatus;
  }
}
