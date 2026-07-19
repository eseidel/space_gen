import 'package:github/model_helpers.dart';
import 'package:github/models/traffic.dart';
import 'package:meta/meta.dart';

/// {@template clone_traffic}
/// Clone Traffic
/// Clone Traffic
/// {@endtemplate}
@immutable
class CloneTraffic {
  /// {@macro clone_traffic}
  const CloneTraffic({
    required this.count,
    required this.uniques,
    required this.clones,
  });

  /// Converts a `Map<String, dynamic>` to a [CloneTraffic].
  factory CloneTraffic.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CloneTraffic',
      json,
      () => CloneTraffic(
        count: json['count'] as int,
        uniques: json['uniques'] as int,
        clones: (json['clones'] as List)
            .map<Traffic>((e) => Traffic.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CloneTraffic? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CloneTraffic.fromJson(json);
  }

  /// Example: `173`
  final int count;

  /// Example: `128`
  final int uniques;
  final List<Traffic> clones;

  /// Converts a [CloneTraffic] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'uniques': uniques,
      'clones': clones.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([count, uniques, listHash(clones)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CloneTraffic &&
        count == other.count &&
        uniques == other.uniques &&
        listsEqual(clones, other.clones);
  }
}
