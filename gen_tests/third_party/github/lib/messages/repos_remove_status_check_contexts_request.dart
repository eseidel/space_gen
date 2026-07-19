// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class ReposRemoveStatusCheckContextsRequest {
  const ReposRemoveStatusCheckContextsRequest();

  factory ReposRemoveStatusCheckContextsRequest.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v =>
        ReposRemoveStatusCheckContextsRequestOneOf0.fromJson(v),
      final List<dynamic> v => ReposRemoveStatusCheckContextsRequestList(
        v.cast<String>(),
      ),
      _ => throw FormatException(
        'Unsupported shape for ReposRemoveStatusCheckContextsRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposRemoveStatusCheckContextsRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ReposRemoveStatusCheckContextsRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ReposRemoveStatusCheckContextsRequestList
    extends ReposRemoveStatusCheckContextsRequest {
  const ReposRemoveStatusCheckContextsRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposRemoveStatusCheckContextsRequestList &&
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
final class ReposRemoveStatusCheckContextsRequestOneOf0
    extends ReposRemoveStatusCheckContextsRequest {
  const ReposRemoveStatusCheckContextsRequestOneOf0({required this.contexts});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposRemoveStatusCheckContextsRequestOneOf0].
  factory ReposRemoveStatusCheckContextsRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposRemoveStatusCheckContextsRequestOneOf0',
      json,
      () => ReposRemoveStatusCheckContextsRequestOneOf0(
        contexts: (json['contexts'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposRemoveStatusCheckContextsRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposRemoveStatusCheckContextsRequestOneOf0.fromJson(json);
  }

  /// The name of the status checks
  final List<String> contexts;

  /// Converts a [ReposRemoveStatusCheckContextsRequestOneOf0]
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
    return other is ReposRemoveStatusCheckContextsRequestOneOf0 &&
        listsEqual(contexts, other.contexts);
  }
}
