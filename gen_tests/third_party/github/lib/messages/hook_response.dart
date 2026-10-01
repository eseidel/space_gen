// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template hook_response}
/// Hook Response
/// {@endtemplate}
@immutable
class HookResponse {
  /// {@macro hook_response}
  const HookResponse({
    required this.code,
    required this.status,
    required this.message,
  });

  /// Converts a `Map<String, dynamic>` to a [HookResponse].
  factory HookResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'HookResponse',
      json,
      () => HookResponse(
        code: checkedKey(json, 'code') as int?,
        status: checkedKey(json, 'status') as String?,
        message: checkedKey(json, 'message') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static HookResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return HookResponse.fromJson(json);
  }

  final int? code;
  final String? status;
  final String? message;

  /// Converts a [HookResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'code': code, 'status': status, 'message': message};
  }

  @override
  int get hashCode => Object.hashAll([code, status, message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HookResponse &&
        code == other.code &&
        status == other.status &&
        message == other.message;
  }
}
