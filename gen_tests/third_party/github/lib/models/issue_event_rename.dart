import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template issue_event_rename}
/// Issue Event Rename
/// Issue Event Rename
/// {@endtemplate}
@immutable
class IssueEventRename {
  /// {@macro issue_event_rename}
  const IssueEventRename({required this.from, required this.to});

  /// Converts a `Map<String, dynamic>` to an [IssueEventRename].
  factory IssueEventRename.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'IssueEventRename',
      json,
      () => IssueEventRename(
        from: json['from'] as String,
        to: json['to'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssueEventRename? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IssueEventRename.fromJson(json);
  }

  final String from;
  final String to;

  /// Converts an [IssueEventRename] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'from': from, 'to': to};
  }

  @override
  int get hashCode => Object.hashAll([from, to]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssueEventRename && from == other.from && to == other.to;
  }
}
