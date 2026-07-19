import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/analyze_location_entity_field.dart';
import 'package:backstage/models/recursive_partial_entity.dart';
import 'package:meta/meta.dart';

/// {@template analyze_location_generate_entity}
/// This is some form of representation of what the analyzer could deduce.
/// We should probably have a chat about how this can best be conveyed to
/// the frontend. It'll probably contain a (possibly incomplete) entity, plus
/// enough info for the frontend to know what form data to show to the user
/// for overriding/completing the info.
/// {@endtemplate}
@immutable
class AnalyzeLocationGenerateEntity {
  /// {@macro analyze_location_generate_entity}
  const AnalyzeLocationGenerateEntity({
    required this.fields,
    required this.entity,
  });

  /// Converts a `Map<String, dynamic>` to an [AnalyzeLocationGenerateEntity].
  factory AnalyzeLocationGenerateEntity.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AnalyzeLocationGenerateEntity',
      json,
      () => AnalyzeLocationGenerateEntity(
        fields: (json['fields'] as List)
            .map<AnalyzeLocationEntityField>(
              (e) => AnalyzeLocationEntityField.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        entity: RecursivePartialEntity.fromJson(
          json['entity'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AnalyzeLocationGenerateEntity? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AnalyzeLocationGenerateEntity.fromJson(json);
  }

  final List<AnalyzeLocationEntityField> fields;

  /// Makes all keys of an entire hierarchy optional.
  final RecursivePartialEntity entity;

  /// Converts an [AnalyzeLocationGenerateEntity] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'fields': fields.map((e) => e.toJson()).toList(),
      'entity': entity.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(fields), entity]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnalyzeLocationGenerateEntity &&
        listsEqual(fields, other.fields) &&
        entity == other.entity;
  }
}
