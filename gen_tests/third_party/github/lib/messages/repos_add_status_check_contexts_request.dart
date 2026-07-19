// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class ReposAddStatusCheckContextsRequest {
  const ReposAddStatusCheckContextsRequest();

  factory ReposAddStatusCheckContextsRequest.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v =>
        ReposAddStatusCheckContextsRequestOneOf0.fromJson(v),
      final List<dynamic> v => ReposAddStatusCheckContextsRequestList(
        v.cast<String>(),
      ),
      _ => throw FormatException(
        'Unsupported shape for ReposAddStatusCheckContextsRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposAddStatusCheckContextsRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ReposAddStatusCheckContextsRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ReposAddStatusCheckContextsRequestList
    extends ReposAddStatusCheckContextsRequest {
  const ReposAddStatusCheckContextsRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposAddStatusCheckContextsRequestList &&
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
final class ReposAddStatusCheckContextsRequestOneOf0
    extends ReposAddStatusCheckContextsRequest {
  const ReposAddStatusCheckContextsRequestOneOf0({required this.contexts});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposAddStatusCheckContextsRequestOneOf0].
  factory ReposAddStatusCheckContextsRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposAddStatusCheckContextsRequestOneOf0',
      json,
      () => ReposAddStatusCheckContextsRequestOneOf0(
        contexts: (json['contexts'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposAddStatusCheckContextsRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposAddStatusCheckContextsRequestOneOf0.fromJson(json);
  }

  /// The name of the status checks
  final List<String> contexts;

  /// Converts a [ReposAddStatusCheckContextsRequestOneOf0]
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
    return other is ReposAddStatusCheckContextsRequestOneOf0 &&
        listsEqual(contexts, other.contexts);
  }
}
