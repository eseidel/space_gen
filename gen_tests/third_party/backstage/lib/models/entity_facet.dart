import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class EntityFacet {
  const EntityFacet({required this.value, required this.count});

  /// Converts a `Map<String, dynamic>` to an [EntityFacet].
  factory EntityFacet.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityFacet',
      json,
      () => EntityFacet(
        value: json['value'] as String,
        count: (json['count'] as num).toDouble(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityFacet? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityFacet.fromJson(json);
  }

  final String value;
  final double count;

  /// Converts an [EntityFacet] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'value': value, 'count': count};
  }

  @override
  int get hashCode => Object.hashAll([value, count]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityFacet && value == other.value && count == other.count;
  }
}
