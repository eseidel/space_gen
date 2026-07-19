import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';

@immutable
class GetStations200ResponseAllOf2Links {
  const GetStations200ResponseAllOf2Links({this.self, this.next, this.prev});

  /// Converts a `Map<String, dynamic>` to a
  /// [GetStations200ResponseAllOf2Links].
  factory GetStations200ResponseAllOf2Links.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'GetStations200ResponseAllOf2Links',
      json,
      () => GetStations200ResponseAllOf2Links(
        self: maybeParseUri(json['self'] as String?),
        next: maybeParseUri(json['next'] as String?),
        prev: maybeParseUri(json['prev'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStations200ResponseAllOf2Links? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStations200ResponseAllOf2Links.fromJson(json);
  }

  final Uri? self;
  final Uri? next;
  final Uri? prev;

  /// Converts a [GetStations200ResponseAllOf2Links]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'self': self?.toString(),
      'next': next?.toString(),
      'prev': prev?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([self, next, prev]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStations200ResponseAllOf2Links &&
        self == other.self &&
        next == other.next &&
        prev == other.prev;
  }
}
