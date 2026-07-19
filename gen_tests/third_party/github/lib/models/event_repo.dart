import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class EventRepo {
  const EventRepo({required this.id, required this.name, required this.url});

  /// Converts a `Map<String, dynamic>` to an [EventRepo].
  factory EventRepo.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EventRepo',
      json,
      () => EventRepo(
        id: json['id'] as int,
        name: json['name'] as String,
        url: Uri.parse(json['url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EventRepo? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EventRepo.fromJson(json);
  }

  final int id;
  final String name;
  final Uri url;

  /// Converts an [EventRepo] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'url': url.toString()};
  }

  @override
  int get hashCode => Object.hashAll([id, name, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EventRepo &&
        id == other.id &&
        name == other.name &&
        url == other.url;
  }
}
