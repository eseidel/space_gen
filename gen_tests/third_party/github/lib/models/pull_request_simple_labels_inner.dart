import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullRequestSimpleLabelsInner {
  const PullRequestSimpleLabelsInner({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.description,
    required this.color,
    required this.default_,
  });

  /// Converts a `Map<String, dynamic>` to a [PullRequestSimpleLabelsInner].
  factory PullRequestSimpleLabelsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullRequestSimpleLabelsInner',
      json,
      () => PullRequestSimpleLabelsInner(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: json['url'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        color: json['color'] as String,
        default_: json['default'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullRequestSimpleLabelsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullRequestSimpleLabelsInner.fromJson(json);
  }

  final int id;
  final String nodeId;
  final String url;
  final String name;
  final String description;
  final String color;
  final bool default_;

  /// Converts a [PullRequestSimpleLabelsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'url': url,
      'name': name,
      'description': description,
      'color': color,
      'default': default_,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, nodeId, url, name, description, color, default_]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullRequestSimpleLabelsInner &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        name == other.name &&
        description == other.description &&
        color == other.color &&
        default_ == other.default_;
  }
}
