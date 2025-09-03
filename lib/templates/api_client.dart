import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:space_gen/templates/api_exception.dart';
import 'package:space_gen/templates/auth.dart';

export 'package:space_gen/templates/auth.dart';

/// The HTTP methods supported by the API.
enum Method {
  delete,
  get,
  patch,
  post,
  put;

  /// Whether the method supports a request body.
  bool get supportsBody => this != get && this != delete;
}

/// The client interface for the API.
/// Subclasses can override [invokeApi] to add custom behavior.
class ApiClient {
  ApiClient({
    Uri? baseUri,
    Client? client,
    this.defaultHeaders = const {},
    this.readSecret,
  }) : baseUri = baseUri ?? Uri.parse('TEMPLATE_BASE_URI'),
       client = client ?? Client();

  final Uri baseUri;
  final Client client;
  final Map<String, String> defaultHeaders;
  final String? Function(String name)? readSecret;

  /// Read a secret from the provided [readSecret] function.
  /// If the function is not provided, returns null.
  String? getSecret(String name) => readSecret?.call(name);

  Uri _resolveUri({
    required String path,
    required Map<String, String> queryParameters,
    required ResolvedAuth auth,
  }) {
    // baseUri can contain a path, so we need to resolve the passed path
    // relative to it.  The passed path will always be absolute (leading slash)
    // but should be interpreted as relative to the baseUri.
    final uri = Uri.parse('$baseUri$path');
    // baseUri can also include query parameters, so we need to merge them.
    final mergedParameters = {...baseUri.queryParameters, ...queryParameters};
    auth.applyToParams(mergedParameters);
    return uri.replace(queryParameters: mergedParameters);
  }

  Map<String, String>? _resolveHeaders({
    required bool bodyIsJson,
    required ResolvedAuth auth,
    required Map<String, String> headerParameters,
  }) {
    final maybeContentType = <String, String>{
      ...defaultHeaders,
      if (bodyIsJson) 'Content-Type': 'application/json',
      ...headerParameters,
    };

    // Apply the auth to the maybeContentType so that headers can still be
    // null if we don't have any headers to set.
    auth.applyToHeaders(maybeContentType);

    // Just pass null to http if we have no headers to set.
    // This makes our calls match openapi (and thus our tests pass).
    return maybeContentType.isEmpty ? null : maybeContentType;
  }

  /// Resolve an [AuthRequest] into a [ResolvedAuth].
  /// Override this to add custom auth handling.
  ResolvedAuth resolveAuth(AuthRequest? authRequest) {
    if (authRequest == null) {
      return const ResolvedAuth.noAuth();
    }
    return authRequest.resolve(getSecret);
  }

  Future<Response> invokeApi({
    required Method method,
    required String path,
    Map<String, String> queryParameters = const {},
    // Body is nullable to allow for post requests which have an optional body
    // to not have to generate two separate calls depending on whether the
    // body is present or not.
    dynamic body,
    Map<String, String> headerParameters = const {},
    AuthRequest? authRequest,
  }) async {
    if (!method.supportsBody && body != null) {
      throw ArgumentError('Body is not allowed for ${method.name} requests');
    }

    final auth = resolveAuth(authRequest);
    final uri = _resolveUri(
      path: path,
      queryParameters: queryParameters,
      auth: auth,
    );
    final encodedBody = body != null ? jsonEncode(body) : null;
    final headers = _resolveHeaders(
      bodyIsJson: encodedBody != null,
      headerParameters: headerParameters,
      auth: auth,
    );

    try {
      switch (method) {
        case Method.delete:
          return client.delete(uri, headers: headers);
        case Method.get:
          return client.get(uri, headers: headers);
        case Method.patch:
          return client.patch(uri, headers: headers, body: encodedBody);
        case Method.post:
          return client.post(uri, headers: headers, body: encodedBody);
        case Method.put:
          return client.put(uri, headers: headers, body: encodedBody);
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }
  }
}
