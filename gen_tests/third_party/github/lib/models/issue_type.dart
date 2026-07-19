import 'package:github/model_helpers.dart';
import 'package:github/models/issue_type_color.dart';
import 'package:meta/meta.dart';

/// {@template issue_type}
/// Issue Type
/// The type of issue.
/// {@endtemplate}
@immutable
class IssueType {
  /// {@macro issue_type}
  const IssueType({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.description,
    this.color,
    this.createdAt,
    this.updatedAt,
    this.isEnabled,
  });

  /// Converts a `Map<String, dynamic>` to an [IssueType].
  factory IssueType.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssueType',
      json,
      () => IssueType(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        description: checkedKey(json, 'description') as String?,
        color: IssueTypeColor.maybeFromJson(json['color'] as String?),
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        updatedAt: maybeParseDateTime(json['updated_at'] as String?),
        isEnabled: json['is_enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueType? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssueType.fromJson(json);
  }

  /// The unique identifier of the issue type.
  final int id;

  /// The node identifier of the issue type.
  final String nodeId;

  /// The name of the issue type.
  final String name;

  /// The description of the issue type.
  final String? description;

  /// The color of the issue type.
  final IssueTypeColor? color;

  /// The time the issue type created.
  final DateTime? createdAt;

  /// The time the issue type last updated.
  final DateTime? updatedAt;

  /// The enabled state of the issue type.
  final bool? isEnabled;

  /// Converts an [IssueType] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'description': description,
      'color': color?.toJson(),
      if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
      if (isEnabled != null) 'is_enabled': isEnabled,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    name,
    description,
    color,
    createdAt,
    updatedAt,
    isEnabled,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssueType &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        description == other.description &&
        color == other.color &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        isEnabled == other.isEnabled;
  }
}
