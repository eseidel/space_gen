// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'dart:async';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/markdown_render_request.dart';

/// Render GitHub flavored markdown
class MarkdownApi {
  MarkdownApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Render a Markdown document
  /// Depending on what is rendered in the Markdown, you may need to provide
  /// additional token scopes for labels, such as `issues:read` or
  /// `pull_requests:read`.
  Future<String> render(MarkdownRenderRequest markdownRenderRequest) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/markdown',
      body: markdownRenderRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return response.body;
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Render a Markdown document in raw mode
  /// You must send Markdown as plain text (using a `Content-Type` header of
  /// `text/plain` or `text/x-markdown`) to this endpoint, rather than using
  /// JSON format. In raw mode, [GitHub Flavored
  /// Markdown](https://github.github.com/gfm/) is not supported and Markdown
  /// will be rendered in plain format like a README.md file. Markdown content
  /// must be 400 KB or less.
  Future<String> renderRaw({String? string}) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/markdown/raw',
      body: string,
      bodyContentType: BodyContentType.textPlain,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return response.body;
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
