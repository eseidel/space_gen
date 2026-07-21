import 'package:const_property/model_helpers.dart';

/// {@template marker}
/// An empty marker object.
/// {@endtemplate}

class Marker {
  /// {@macro marker}
  Marker();

  /// Converts a `Map<String, dynamic>` to a [Marker].
  factory Marker.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson('Marker', json, Marker.new);
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Marker? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Marker.fromJson(json);
  }

  String get kind => 'marker';

  /// Converts a [Marker] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'kind': kind};
  }

  @override
  int get hashCode => Object.hashAll([]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Marker;
  }
}
