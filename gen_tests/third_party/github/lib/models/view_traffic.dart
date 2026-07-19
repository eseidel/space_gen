import 'package:github/model_helpers.dart';
import 'package:github/models/traffic.dart';
import 'package:meta/meta.dart';

/// {@template view_traffic}
/// View Traffic
/// View Traffic
/// {@endtemplate}
@immutable
class ViewTraffic {
  /// {@macro view_traffic}
  const ViewTraffic({
    required this.count,
    required this.uniques,
    required this.views,
  });

  /// Converts a `Map<String, dynamic>` to a [ViewTraffic].
  factory ViewTraffic.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ViewTraffic',
      json,
      () => ViewTraffic(
        count: json['count'] as int,
        uniques: json['uniques'] as int,
        views: (json['views'] as List)
            .map<Traffic>((e) => Traffic.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ViewTraffic? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ViewTraffic.fromJson(json);
  }

  /// Example: `14850`
  final int count;

  /// Example: `3782`
  final int uniques;
  final List<Traffic> views;

  /// Converts a [ViewTraffic] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'uniques': uniques,
      'views': views.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([count, uniques, listHash(views)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ViewTraffic &&
        count == other.count &&
        uniques == other.uniques &&
        listsEqual(views, other.views);
  }
}
