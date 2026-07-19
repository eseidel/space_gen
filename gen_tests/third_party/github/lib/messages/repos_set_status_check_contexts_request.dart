// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class ReposSetStatusCheckContextsRequest {
  const ReposSetStatusCheckContextsRequest();

  factory ReposSetStatusCheckContextsRequest.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v =>
        ReposSetStatusCheckContextsRequestOneOf0.fromJson(v),
      final List<dynamic> v => ReposSetStatusCheckContextsRequestList(
        v.cast<String>(),
      ),
      _ => throw FormatException(
        'Unsupported shape for ReposSetStatusCheckContextsRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposSetStatusCheckContextsRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ReposSetStatusCheckContextsRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ReposSetStatusCheckContextsRequestList
    extends ReposSetStatusCheckContextsRequest {
  const ReposSetStatusCheckContextsRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposSetStatusCheckContextsRequestList &&
        value == other.value;
  }
}

/// Example:
/// ```json
/// {
///   "contexts": [
///     "contexts"
///   ]
/// }
/// ```
@immutable
final class ReposSetStatusCheckContextsRequestOneOf0
    extends ReposSetStatusCheckContextsRequest {
  const ReposSetStatusCheckContextsRequestOneOf0({required this.contexts});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposSetStatusCheckContextsRequestOneOf0].
  factory ReposSetStatusCheckContextsRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposSetStatusCheckContextsRequestOneOf0',
      json,
      () => ReposSetStatusCheckContextsRequestOneOf0(
        contexts: (json['contexts'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposSetStatusCheckContextsRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposSetStatusCheckContextsRequestOneOf0.fromJson(json);
  }

  /// The name of the status checks
  final List<String> contexts;

  /// Converts a [ReposSetStatusCheckContextsRequestOneOf0]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'contexts': contexts};
  }

  @override
  int get hashCode => listHash(contexts).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposSetStatusCheckContextsRequestOneOf0 &&
        listsEqual(contexts, other.contexts);
  }
}
