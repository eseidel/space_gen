import 'package:const_property/model_helpers.dart';

/// {@template list_resp}
/// A paginated list response.
/// {@endtemplate}

class ListResp {
  /// {@macro list_resp}
  ListResp({required this.count, this.apiVersion, this.revision});

  /// Converts a `Map<String, dynamic>` to a [ListResp].
  factory ListResp.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'ListResp',
      json,
      () => ListResp(
        apiVersion: json['apiVersion'] as String?,
        revision: json['revision'] as int?,
        count: json['count'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ListResp? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ListResp.fromJson(json);
  }

  /// The single legal value of `apiVersion`, exposed so it can be set
  /// explicitly.
  static const String apiVersionValue = '2024-01-01';

  /// The single legal value of `revision`, exposed so it can be set
  /// explicitly.
  static const int revisionValue = 5;

  /// The type of this object.
  String get object => 'list';

  /// The API version this response was produced with.
  String? apiVersion;
  int? revision;
  int count;

  /// Converts a [ListResp] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'apiVersion': ?apiVersion,
      'revision': ?revision,
      'count': count,
    };
  }

  @override
  int get hashCode => Object.hashAll([apiVersion, revision, count]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ListResp &&
        apiVersion == other.apiVersion &&
        revision == other.revision &&
        count == other.count;
  }
}
