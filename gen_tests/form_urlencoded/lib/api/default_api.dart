import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:form_urlencoded/api_client.dart';
import 'package:form_urlencoded/api_exception.dart';
import 'package:form_urlencoded/model/create_payment_request.dart';
import 'package:form_urlencoded/model/create_session_request.dart';
import 'package:form_urlencoded/model/edit_product_request.dart';
import 'package:form_urlencoded/model/subscribe_request.dart';
import 'package:form_urlencoded/model/update_preferences_request.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Log in with a form-urlencoded body (openfoodfacts session.pl).
  Future<void> createSession(CreateSessionRequest createSessionRequest) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/session',
      body: <String, String>{
        'user_id': createSessionRequest.userId,
        'password': createSessionRequest.password,
        if (createSessionRequest.remember case final value?)
          'remember': value.toString(),
        if (createSessionRequest.attempts case final value?)
          'attempts': value.toString(),
      },
      bodyContentType: BodyContentType.formUrlEncoded,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Form body with enum + date scalar fields.
  Future<void> updatePreferences(
    UpdatePreferencesRequest updatePreferencesRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/preferences',
      body: <String, String>{
        'visibility': updatePreferencesRequest.visibility.toJson(),
        if (updatePreferencesRequest.since case final value?)
          'since': value.toJson(),
      },
      bodyContentType: BodyContentType.formUrlEncoded,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Endpoint whose form-urlencoded body itself is optional.
  Future<void> subscribe({SubscribeRequest? subscribeRequest}) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/subscribe',
      body: <String, String>{
        if (subscribeRequest?.email case final value?) 'email': value,
        if (subscribeRequest?.topic case final value?) 'topic': value,
      },
      bodyContentType: BodyContentType.formUrlEncoded,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Array-of-scalar fields comma-join into one field.
  Future<void> editProduct(EditProductRequest editProductRequest) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/products',
      body: <String, String>{
        'code': editProductRequest.code,
        'brands': editProductRequest.brands.join(','),
        'labels': editProductRequest.labels.join(','),
      },
      bodyContentType: BodyContentType.formUrlEncoded,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Complex form fields JSON-encode (Twilio Payments.Parameter).
  Future<void> createPayment(CreatePaymentRequest createPaymentRequest) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/payments',
      body: <String, String>{
        'idempotency_key': createPaymentRequest.idempotencyKey,
        if (createPaymentRequest.parameters case final value?)
          'parameters': jsonEncode(value),
        if (createPaymentRequest.address case final value?)
          'address': jsonEncode(value.toJson()),
        'line_items': jsonEncode(
          createPaymentRequest.lineItems.map((e) => e.toJson()).toList(),
        ),
      },
      bodyContentType: BodyContentType.formUrlEncoded,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
