import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CreateGuildTemplateRequest {
  CreateGuildTemplateRequest({required this.name, this.description}) {
    name.validate(minLength: 1, maxLength: 100);
    description?.validate(maxLength: 120);
  }

  /// Converts a `Map<String, dynamic>` to a [CreateGuildTemplateRequest].
  factory CreateGuildTemplateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateGuildTemplateRequest',
      json,
      () => CreateGuildTemplateRequest(
        name: json['name'] as String,
        description: json['description'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateGuildTemplateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateGuildTemplateRequest.fromJson(json);
  }

  final String name;
  final String? description;

  /// Converts a [CreateGuildTemplateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description};
  }

  @override
  int get hashCode => Object.hashAll([name, description]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateGuildTemplateRequest &&
        name == other.name &&
        description == other.description;
  }
}
