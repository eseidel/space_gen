import 'package:discord/messages/vanity_url_error_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class VanityUrlResponse {
  const VanityUrlResponse({required this.code, required this.uses, this.error});

  /// Converts a `Map<String, dynamic>` to a [VanityUrlResponse].
  factory VanityUrlResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'VanityUrlResponse',
      json,
      () => VanityUrlResponse(
        code: checkedKey(json, 'code') as String?,
        uses: json['uses'] as int,
        error: VanityUrlErrorResponse.maybeFromJson(
          json['error'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static VanityUrlResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return VanityUrlResponse.fromJson(json);
  }

  final String? code;
  final int uses;
  final VanityUrlErrorResponse? error;

  /// Converts a [VanityUrlResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'code': code, 'uses': uses, 'error': error?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([code, uses, error]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VanityUrlResponse &&
        code == other.code &&
        uses == other.uses &&
        error == other.error;
  }
}
