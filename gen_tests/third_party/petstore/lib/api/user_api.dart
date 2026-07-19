import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:petstore/api_client.dart';
import 'package:petstore/api_exception.dart';
import 'package:petstore/models/user.dart';

/// Operations about user
class UserApi {
  UserApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Create user.
  /// This can only be done by the logged in user.
  Future<User> createUser({User? user}) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user',
      body: user?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Creates list of users with given input array.
  /// Creates list of users with given input array.
  Future<User> createUsersWithListInput({List<User>? list}) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/createWithList',
      body: list?.map((e) => e.toJson()).toList(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Logs user into the system.
  /// Log into the system.
  Future<String> loginUser({String? username, String? password}) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/login',
      queryParameters: {
        if (username != null) 'username': [username],
        if (password != null) 'password': [password],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body) as String;
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Logs out current logged in user session.
  /// Log user out of the system.
  Future<void> logoutUser() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/logout',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get user by user name.
  /// Get user detail based on username.
  Future<User> getUserByName(String username) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update user resource.
  /// This can only be done by the logged in user.
  Future<void> updateUser(String username, {User? user}) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/user/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      body: user?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Delete user resource.
  /// This can only be done by the logged in user.
  Future<void> deleteUser(String username) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
