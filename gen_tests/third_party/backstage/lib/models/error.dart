// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:backstage/messages/error_request.dart';
import 'package:backstage/messages/error_response.dart';
import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/error_error.dart';
import 'package:meta/meta.dart';

@immutable
class Error {
  const Error({
    required this.error,
    required this.response,
    required this.entries,
    this.request,
  });

  /// Converts a `Map<String, dynamic>` to an [Error].
  factory Error.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Error',
      json,
      () => Error(
        error: ErrorError.fromJson(json['error'] as Map<String, dynamic>),
        request: ErrorRequest.maybeFromJson(
          json['request'] as Map<String, dynamic>?,
        ),
        response: ErrorResponse.fromJson(
          json['response'] as Map<String, dynamic>,
        ),
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {'error', 'request', 'response'}.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Error? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Error.fromJson(json);
  }

  final ErrorError error;
  final ErrorRequest? request;
  final ErrorResponse response;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'error' => error,
    'request' => request,
    'response' => response,
    _ => entries[key],
  };

  /// Converts an [Error] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'error': error.toJson(),
      if (request != null) 'request': request?.toJson(),
      'response': response.toJson(),
      for (final entry in entries.entries)
        if (!const {'error', 'request', 'response'}.contains(entry.key))
          entry.key: entry.value,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([error, request, response, mapHash(entries)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Error &&
        error == other.error &&
        request == other.request &&
        response == other.response &&
        mapsEqual(entries, other.entries);
  }
}
