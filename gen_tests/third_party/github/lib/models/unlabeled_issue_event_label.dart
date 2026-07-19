import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UnlabeledIssueEventLabel {
  const UnlabeledIssueEventLabel({required this.name, required this.color});

  /// Converts a `Map<String, dynamic>` to a [UnlabeledIssueEventLabel].
  factory UnlabeledIssueEventLabel.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UnlabeledIssueEventLabel',
      json,
      () => UnlabeledIssueEventLabel(
        name: json['name'] as String,
        color: json['color'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UnlabeledIssueEventLabel? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UnlabeledIssueEventLabel.fromJson(json);
  }

  final String name;
  final String color;

  /// Converts a [UnlabeledIssueEventLabel] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'color': color};
  }

  @override
  int get hashCode => Object.hashAll([name, color]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UnlabeledIssueEventLabel &&
        name == other.name &&
        color == other.color;
  }
}
