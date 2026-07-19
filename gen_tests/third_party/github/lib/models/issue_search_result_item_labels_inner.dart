import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class IssueSearchResultItemLabelsInner {
  const IssueSearchResultItemLabelsInner({
    this.id,
    this.nodeId,
    this.url,
    this.name,
    this.color,
    this.default_,
    this.description,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [IssueSearchResultItemLabelsInner].
  factory IssueSearchResultItemLabelsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssueSearchResultItemLabelsInner',
      json,
      () => IssueSearchResultItemLabelsInner(
        id: json['id'] as int?,
        nodeId: json['node_id'] as String?,
        url: json['url'] as String?,
        name: json['name'] as String?,
        color: json['color'] as String?,
        default_: json['default'] as bool?,
        description: json['description'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueSearchResultItemLabelsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssueSearchResultItemLabelsInner.fromJson(json);
  }

  final int? id;
  final String? nodeId;
  final String? url;
  final String? name;
  final String? color;
  final bool? default_;
  final String? description;

  /// Converts an [IssueSearchResultItemLabelsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': ?id,
      'node_id': ?nodeId,
      'url': ?url,
      'name': ?name,
      'color': ?color,
      'default': ?default_,
      'description': description,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, nodeId, url, name, color, default_, description]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssueSearchResultItemLabelsInner &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        name == other.name &&
        color == other.color &&
        default_ == other.default_ &&
        description == other.description;
  }
}
