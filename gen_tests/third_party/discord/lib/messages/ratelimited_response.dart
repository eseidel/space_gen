import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template ratelimited_response}
/// Ratelimit error object returned by the Discord API
/// {@endtemplate}
@immutable
class RatelimitedResponse {
  /// {@macro ratelimited_response}
  const RatelimitedResponse({
    required this.code,
    required this.message,
    required this.retryAfter,
    required this.global,
  });

  /// Converts a `Map<String, dynamic>` to a [RatelimitedResponse].
  factory RatelimitedResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RatelimitedResponse',
      json,
      () => RatelimitedResponse(
        code: json['code'] as int,
        message: json['message'] as String,
        retryAfter: (json['retry_after'] as num).toDouble(),
        global: json['global'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RatelimitedResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RatelimitedResponse.fromJson(json);
  }

  /// Discord internal error code. See error code reference
  final int code;

  /// Human-readable error message
  final String message;

  /// The number of seconds to wait before retrying your request
  final double retryAfter;

  /// Whether you are being ratelimited by the global ratelimit or a
  /// per-endpoint ratelimit
  final bool global;

  /// Converts a [RatelimitedResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'retry_after': retryAfter,
      'global': global,
    };
  }

  @override
  int get hashCode => Object.hashAll([code, message, retryAfter, global]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RatelimitedResponse &&
        code == other.code &&
        message == other.message &&
        retryAfter == other.retryAfter &&
        global == other.global;
  }
}
