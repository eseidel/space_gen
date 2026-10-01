// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class WidgetActivity {
  const WidgetActivity({required this.name});

  /// Converts a `Map<String, dynamic>` to a [WidgetActivity].
  factory WidgetActivity.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WidgetActivity',
      json,
      () => WidgetActivity(name: json['name'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WidgetActivity? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WidgetActivity.fromJson(json);
  }

  final String name;

  /// Converts a [WidgetActivity] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WidgetActivity && name == other.name;
  }
}
