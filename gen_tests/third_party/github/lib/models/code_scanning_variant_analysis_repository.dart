import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template code_scanning_variant_analysis_repository}
/// Repository Identifier
/// Repository Identifier
/// {@endtemplate}
@immutable
class CodeScanningVariantAnalysisRepository {
  /// {@macro code_scanning_variant_analysis_repository}
  const CodeScanningVariantAnalysisRepository({
    required this.id,
    required this.name,
    required this.fullName,
    required this.private,
    required this.stargazersCount,
    required this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodeScanningVariantAnalysisRepository].
  factory CodeScanningVariantAnalysisRepository.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodeScanningVariantAnalysisRepository',
      json,
      () => CodeScanningVariantAnalysisRepository(
        id: json['id'] as int,
        name: json['name'] as String,
        fullName: json['full_name'] as String,
        private: json['private'] as bool,
        stargazersCount: json['stargazers_count'] as int,
        updatedAt: maybeParseDateTime(
          checkedKey(json, 'updated_at') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysisRepository? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysisRepository.fromJson(json);
  }

  /// A unique identifier of the repository.
  /// Example: `1296269`
  final int id;

  /// The name of the repository.
  /// Example: `'Hello-World'`
  final String name;

  /// The full, globally unique, name of the repository.
  /// Example: `'octocat/Hello-World'`
  final String fullName;

  /// Whether the repository is private.
  final bool private;

  /// Example: `80`
  final int stargazersCount;

  /// Example: `'2011-01-26T19:14:43Z'`
  final DateTime? updatedAt;

  /// Converts a [CodeScanningVariantAnalysisRepository]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'full_name': fullName,
      'private': private,
      'stargazers_count': stargazersCount,
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, name, fullName, private, stargazersCount, updatedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningVariantAnalysisRepository &&
        id == other.id &&
        name == other.name &&
        fullName == other.fullName &&
        private == other.private &&
        stargazersCount == other.stargazersCount &&
        updatedAt == other.updatedAt;
  }
}
