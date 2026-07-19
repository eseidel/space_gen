import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template traffic}
/// Traffic
/// {@endtemplate}
@immutable
class Traffic {
  /// {@macro traffic}
  const Traffic({
    required this.timestamp,
    required this.uniques,
    required this.count,
  });

  /// Converts a `Map<String, dynamic>` to a [Traffic].
  factory Traffic.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Traffic',
      json,
      () => Traffic(
        timestamp: DateTime.parse(json['timestamp'] as String),
        uniques: json['uniques'] as int,
        count: json['count'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Traffic? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Traffic.fromJson(json);
  }

  final DateTime timestamp;
  final int uniques;
  final int count;

  /// Converts a [Traffic] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'uniques': uniques,
      'count': count,
    };
  }

  @override
  int get hashCode => Object.hashAll([timestamp, uniques, count]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Traffic &&
        timestamp == other.timestamp &&
        uniques == other.uniques &&
        count == other.count;
  }
}
