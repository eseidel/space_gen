import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetStatus200ResponseLinksInner {
  const GetStatus200ResponseLinksInner({required this.name, required this.url});

  /// Converts a `Map<String, dynamic>` to a [GetStatus200ResponseLinksInner].
  factory GetStatus200ResponseLinksInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetStatus200ResponseLinksInner',
      json,
      () => GetStatus200ResponseLinksInner(
        name: json['name'] as String,
        url: Uri.parse(json['url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseLinksInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseLinksInner.fromJson(json);
  }

  final String name;
  final Uri url;

  /// Converts a [GetStatus200ResponseLinksInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url.toString()};
  }

  @override
  int get hashCode => Object.hashAll([name, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseLinksInner &&
        name == other.name &&
        url == other.url;
  }
}
