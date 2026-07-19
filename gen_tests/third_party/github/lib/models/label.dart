import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template label}
/// Label
/// Color-coded labels help you categorize and filter your issues (just like
/// labels in Gmail).
/// {@endtemplate}
@immutable
class Label {
  /// {@macro label}
  const Label({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.description,
    required this.color,
    required this.default_,
  });

  /// Converts a `Map<String, dynamic>` to a [Label].
  factory Label.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Label',
      json,
      () => Label(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        name: json['name'] as String,
        description: checkedKey(json, 'description') as String?,
        color: json['color'] as String,
        default_: json['default'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Label? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Label.fromJson(json);
  }

  /// Unique identifier for the label.
  /// Example: `208045946`
  final int id;

  /// Example: `'MDU6TGFiZWwyMDgwNDU5NDY='`
  final String nodeId;

  /// URL for the label
  /// Example: `'https://api.github.com/repositories/42/labels/bug'`
  final Uri url;

  /// The name of the label.
  /// Example: `'bug'`
  final String name;

  /// Optional description of the label, such as its purpose.
  /// Example: `'Something isn\'t working'`
  final String? description;

  /// 6-character hex code, without the leading #, identifying the color
  /// Example: `'FFFFFF'`
  final String color;

  /// Whether this label comes by default in a new repository.
  /// Example: `true`
  final bool default_;

  /// Converts a [Label] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'url': url.toString(),
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
    return other is Label &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        name == other.name &&
        description == other.description &&
        color == other.color &&
        default_ == other.default_;
  }
}
