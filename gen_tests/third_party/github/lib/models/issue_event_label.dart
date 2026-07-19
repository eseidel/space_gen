import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template issue_event_label}
/// Issue Event Label
/// Issue Event Label
/// {@endtemplate}
@immutable
class IssueEventLabel {
  /// {@macro issue_event_label}
  const IssueEventLabel({required this.name, required this.color});

  /// Converts a `Map<String, dynamic>` to an [IssueEventLabel].
  factory IssueEventLabel.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssueEventLabel',
      json,
      () => IssueEventLabel(
        name: checkedKey(json, 'name') as String?,
        color: checkedKey(json, 'color') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueEventLabel? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssueEventLabel.fromJson(json);
  }

  final String? name;
  final String? color;

  /// Converts an [IssueEventLabel] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'color': color};
  }

  @override
  int get hashCode => Object.hashAll([name, color]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssueEventLabel &&
        name == other.name &&
        color == other.color;
  }
}
