import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template remove_mount_request}
/// Remove Mount Request
/// {@endtemplate}
@immutable
class RemoveMountRequest {
  /// {@macro remove_mount_request}
  const RemoveMountRequest({required this.symbol});

  /// Converts a `Map<String, dynamic>` to a [RemoveMountRequest].
  factory RemoveMountRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RemoveMountRequest',
      json,
      () => RemoveMountRequest(symbol: json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemoveMountRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RemoveMountRequest.fromJson(json);
  }

  /// The symbol of the mount to remove.
  final String symbol;

  /// Converts a [RemoveMountRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RemoveMountRequest && symbol == other.symbol;
  }
}
