import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:void_error_response/api_exception.dart';
import 'package:void_error_response/auth.dart';

export 'package:void_error_response/auth.dart';

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

/// Content type of a request body passed to [ApiClient.invokeApi].
///
/// [json] bodies are JSON-encoded and sent with `Content-Type:
/// application/json`; [octetStream] and [textPlain] pass the body through
/// unchanged and set the matching `Content-Type` header.
/// [multipartFormData] is a marker value — the actual send path lives in
/// [ApiClient.invokeApiMultipart], which sets the `Content-Type` with a
/// generated boundary itself.
enum BodyContentType {
  json('application/json'),
  multipartFormData('multipart/form-data'),
  octetStream('application/octet-stream'),
  textPlain('text/plain');

  const BodyContentType(this.value);

  final String value;
}

/// The client interface for the API.
/// Subclasses can override [invokeApi] to add custom behavior.
class ApiClient {
  ApiClient({
    Uri? baseUri,
    Client? client,
    this.defaultHeaders = const {},
    this.readSecret,
  }) : baseUri = baseUri ?? Uri.parse('https://example.com/api/v1'),
       client = client ?? Client();

  final Uri baseUri;
  final Client client;
  final Map<String, String> defaultHeaders;
  final String? Function(String name)? readSecret;

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
    required BodyContentType? bodyContentType,
    required ResolvedAuth auth,
    required Map<String, String> headerParameters,
  }) {
    final headers = <String, String>{
      ...defaultHeaders,
      if (bodyContentType != null) 'Content-Type': bodyContentType.value,
      ...headerParameters,
    };

    // Apply auth after base headers so that headers can still be empty and
    // we can return null below.
    auth.applyToHeaders(headers);

    // Just pass null to http if we have no headers to set.
    // This makes our calls match openapi (and thus our tests pass).
    return headers.isEmpty ? null : headers;
  }

  /// Resolve an [AuthRequest] into a [ResolvedAuth].
  /// Override this to add custom auth handling.
  ResolvedAuth resolveAuth(AuthRequest? authRequest) {
    if (authRequest == null) {
      return const ResolvedAuth.noAuth();
    }
    String? getSecret(String name) => readSecret?.call(name);
    return authRequest.resolve(getSecret);
  }

  /// Wraps a request send with the common exception → [ApiException]
  /// mapping used by all `invokeApi*` methods.
  Future<Response> _sendWithExceptionMapping({
    required Method method,
    required String path,
    required Future<Response> Function() send,
  }) async {
    try {
      return await send();
    } on SocketException catch (error, trace) {
      throw ApiException<Object?>.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException<Object?>.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException<Object?>.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException<Object?>.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException<Object?>.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }
  }

  Future<Response> invokeApi({
    required Method method,
    required String path,
    Map<String, String> queryParameters = const {},
    // Body is nullable to allow for post requests which have an optional body
    // to not have to generate two separate calls depending on whether the
    // body is present or not.
    Object? body,
    BodyContentType bodyContentType = BodyContentType.json,
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
    // Only the JSON path runs through jsonEncode; binary/text bodies pass
    // through so the receiving server gets the bytes/string as-written.
    final Object? encodedBody;
    if (body == null) {
      encodedBody = null;
    } else if (bodyContentType == BodyContentType.json) {
      encodedBody = jsonEncode(body);
    } else {
      encodedBody = body;
    }
    final headers = _resolveHeaders(
      bodyContentType: body != null ? bodyContentType : null,
      headerParameters: headerParameters,
      auth: auth,
    );

    return _sendWithExceptionMapping(
      method: method,
      path: path,
      send: () => switch (method) {
        Method.delete => client.delete(uri, headers: headers),
        Method.get => client.get(uri, headers: headers),
        Method.patch => client.patch(uri, headers: headers, body: encodedBody),
        Method.post => client.post(uri, headers: headers, body: encodedBody),
        Method.put => client.put(uri, headers: headers, body: encodedBody),
      },
    );
  }

  /// Send a `multipart/form-data` request built from [fields] (text parts)
  /// and [files] (file parts). The `Content-Type` header is set by
  /// [MultipartRequest] itself, including the generated boundary — do not
  /// pass one via [headerParameters].
  Future<Response> invokeApiMultipart({
    required Method method,
    required String path,
    required Map<String, String> fields,
    required List<MultipartFile> files,
    Map<String, String> queryParameters = const {},
    Map<String, String> headerParameters = const {},
    AuthRequest? authRequest,
  }) async {
    if (!method.supportsBody) {
      throw ArgumentError(
        'Multipart body is not allowed for ${method.name} requests',
      );
    }

    final auth = resolveAuth(authRequest);
    final uri = _resolveUri(
      path: path,
      queryParameters: queryParameters,
      auth: auth,
    );

    // MultipartRequest generates its own Content-Type with boundary, so
    // pass null here to avoid appending application/json.
    final headers = _resolveHeaders(
      bodyContentType: null,
      headerParameters: headerParameters,
      auth: auth,
    );

    final request = MultipartRequest(method.name.toUpperCase(), uri)
      ..fields.addAll(fields)
      ..files.addAll(files);
    if (headers != null) {
      request.headers.addAll(headers);
    }

    return _sendWithExceptionMapping(
      method: method,
      path: path,
      send: () async {
        final streamed = await client.send(request);
        return Response.fromStream(streamed);
      },
    );
  }
}
