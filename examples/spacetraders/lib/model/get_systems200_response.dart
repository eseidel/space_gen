import 'package:meta/meta.dart';
import 'package:spacetraders/model/meta.dart';
import 'package:spacetraders/model/system.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetSystems200Response {
  const GetSystems200Response({required this.meta, this.data = const []});

  factory GetSystems200Response.fromJson(Map<String, dynamic> json) {
    return GetSystems200Response(
      data: (json['data'] as List)
          .map<System>((e) => System.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSystems200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetSystems200Response.fromJson(json);
  }

  final List<System> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }

  @override
  int get hashCode => Object.hash(data, meta);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetSystems200Response &&
        listsEqual(data, other.data) &&
        meta == other.meta;
  }
}
