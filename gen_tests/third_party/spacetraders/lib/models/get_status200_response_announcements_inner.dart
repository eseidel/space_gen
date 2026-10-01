// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetStatus200ResponseAnnouncementsInner {
  const GetStatus200ResponseAnnouncementsInner({
    required this.title,
    required this.body,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [GetStatus200ResponseAnnouncementsInner].
  factory GetStatus200ResponseAnnouncementsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'GetStatus200ResponseAnnouncementsInner',
      json,
      () => GetStatus200ResponseAnnouncementsInner(
        title: json['title'] as String,
        body: json['body'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetStatus200ResponseAnnouncementsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetStatus200ResponseAnnouncementsInner.fromJson(json);
  }

  final String title;
  final String body;

  /// Converts a [GetStatus200ResponseAnnouncementsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': title, 'body': body};
  }

  @override
  int get hashCode => Object.hashAll([title, body]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetStatus200ResponseAnnouncementsInner &&
        title == other.title &&
        body == other.body;
  }
}
