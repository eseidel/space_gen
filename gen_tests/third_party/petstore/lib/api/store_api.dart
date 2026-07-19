import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:petstore/api_client.dart';
import 'package:petstore/api_exception.dart';
import 'package:petstore/models/order.dart';

/// Access to Petstore orders
class StoreApi {
  StoreApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Returns pet inventories by status.
  /// Returns a map of status codes to quantities.
  Future<Map<String, int>> getInventory() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/store/inventory',
      authRequest: const ApiKeyAuth(
        name: 'api_key',
        secretName: 'api_key',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, value as int),
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Place an order for a pet.
  /// Place a new order in the store.
  Future<Order> placeOrder({Order? order}) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/store/order',
      body: order?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Order.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Find purchase order by ID.
  /// For valid response try integer IDs with value <= 5 or > 10. Other values
  /// will generate exceptions.
  Future<Order> getOrderById(int orderId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/store/order/{orderId}'.replaceAll('{orderId}', '$orderId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Order.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete purchase order by identifier.
  /// For valid response try integer IDs with value < 1000. Anything above
  /// 1000 or non-integers will generate API errors.
  Future<void> deleteOrder(int orderId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/store/order/{orderId}'.replaceAll('{orderId}', '$orderId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
