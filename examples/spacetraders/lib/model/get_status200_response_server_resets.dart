import 'package:meta/meta.dart';

@immutable
class GetStatus200ResponseServerResets {
  const GetStatus200ResponseServerResets({
    required this.next,
    required this.frequency,
  });

  factory GetStatus200ResponseServerResets.fromJson(Map<String, dynamic> json) {
    return GetStatus200ResponseServerResets(
      next: json['next'] as String,
      frequency: json['frequency'] as String,
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

  final String next;
  final String frequency;

  Map<String, dynamic> toJson() {
    return {'next': next, 'frequency': frequency};
  }

  @override
  int get hashCode => Object.hash(next, frequency);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseServerResets &&
        next == other.next &&
        frequency == other.frequency;
  }
}
