import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateGuildTemplateRequest {
  const UpdateGuildTemplateRequest({this.name, this.description});

  /// Converts a `Map<String, dynamic>` to a [UpdateGuildTemplateRequest].
  factory UpdateGuildTemplateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateGuildTemplateRequest',
      json,
      () => UpdateGuildTemplateRequest(
        name: json['name'] as String?,
        description: json['description'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateGuildTemplateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateGuildTemplateRequest.fromJson(json);
  }

  final String? name;
  final String? description;

  /// Converts a [UpdateGuildTemplateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (name != null) 'name': name, 'description': description};
  }

  @override
  int get hashCode => Object.hashAll([name, description]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateGuildTemplateRequest &&
        name == other.name &&
        description == other.description;
  }
}
