import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/analyze_location_existing_entity.dart';
import 'package:backstage/models/analyze_location_generate_entity.dart';
import 'package:meta/meta.dart';

@immutable
class AnalyzeLocationResponse {
  const AnalyzeLocationResponse({
    required this.generateEntities,
    required this.existingEntityFiles,
  });

  /// Converts a `Map<String, dynamic>` to an [AnalyzeLocationResponse].
  factory AnalyzeLocationResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AnalyzeLocationResponse',
      json,
      () => AnalyzeLocationResponse(
        generateEntities: (json['generateEntities'] as List)
            .map<AnalyzeLocationGenerateEntity>(
              (e) => AnalyzeLocationGenerateEntity.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        existingEntityFiles: (json['existingEntityFiles'] as List)
            .map<AnalyzeLocationExistingEntity>(
              (e) => AnalyzeLocationExistingEntity.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AnalyzeLocationResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AnalyzeLocationResponse.fromJson(json);
  }

  final List<AnalyzeLocationGenerateEntity> generateEntities;
  final List<AnalyzeLocationExistingEntity> existingEntityFiles;

  /// Converts an [AnalyzeLocationResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'generateEntities': generateEntities.map((e) => e.toJson()).toList(),
      'existingEntityFiles': existingEntityFiles
          .map((e) => e.toJson())
          .toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(generateEntities),
    listHash(existingEntityFiles),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnalyzeLocationResponse &&
        listsEqual(generateEntities, other.generateEntities) &&
        listsEqual(existingEntityFiles, other.existingEntityFiles);
  }
}
