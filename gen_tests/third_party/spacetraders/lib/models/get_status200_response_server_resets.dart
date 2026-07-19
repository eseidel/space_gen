import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetStatus200ResponseServerResets {
  const GetStatus200ResponseServerResets({
    required this.next,
    required this.frequency,
  });

  /// Converts a `Map<String, dynamic>` to a [GetStatus200ResponseServerResets].
  factory GetStatus200ResponseServerResets.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetStatus200ResponseServerResets',
      json,
      () => GetStatus200ResponseServerResets(
        next: json['next'] as String,
        frequency: json['frequency'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseServerResets? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseServerResets.fromJson(json);
  }

  /// The date and time when the game server will reset.
  final String next;

  /// How often we intend to reset the game server.
  final String frequency;

  /// Converts a [GetStatus200ResponseServerResets] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'next': next, 'frequency': frequency};
  }

  @override
  int get hashCode => Object.hashAll([next, frequency]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseServerResets &&
        next == other.next &&
        frequency == other.frequency;
  }
}
