import 'package:const_property/model_helpers.dart';

/// {@template list_resp}
/// Envelope whose marker fields are fixed to a lone scalar `const`. Each
/// renders as a fixed getter returning the literal, not a single-value enum
/// type — see issue #240.
/// {@endtemplate}

class ListResp {
  /// {@macro list_resp}
  ListResp({required this.count});

  /// Converts a `Map<String, dynamic>` to a [ListResp].
  factory ListResp.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'ListResp',
      json,
      () => ListResp(count: json['count'] as int),
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

  /// Envelope marker fixed to the literal 'list'.
  String get object => 'list';
  String get apiVersion => '2024-01-01';
  int get revision => 5;
  int count;

  /// Converts a [ListResp] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'apiVersion': apiVersion,
      'revision': revision,
      'count': count,
    };
  }

  @override
  int get hashCode => count.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ListResp && count == other.count;
  }
}
