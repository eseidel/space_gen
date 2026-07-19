import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';

@immutable
class GetBookings200ResponseAllOf2Links {
  const GetBookings200ResponseAllOf2Links({this.self, this.next, this.prev});

  /// Converts a `Map<String, dynamic>` to a
  /// [GetBookings200ResponseAllOf2Links].
  factory GetBookings200ResponseAllOf2Links.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'GetBookings200ResponseAllOf2Links',
      json,
      () => GetBookings200ResponseAllOf2Links(
        self: maybeParseUri(json['self'] as String?),
        next: maybeParseUri(json['next'] as String?),
        prev: maybeParseUri(json['prev'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetBookings200ResponseAllOf2Links? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetBookings200ResponseAllOf2Links.fromJson(json);
  }

  final Uri? self;
  final Uri? next;
  final Uri? prev;

  /// Converts a [GetBookings200ResponseAllOf2Links]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (self != null) 'self': self?.toString(),
      if (next != null) 'next': next?.toString(),
      if (prev != null) 'prev': prev?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([self, next, prev]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetBookings200ResponseAllOf2Links &&
        self == other.self &&
        next == other.next &&
        prev == other.prev;
  }
}
