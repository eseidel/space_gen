import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RenamedIssueEventRename {
  const RenamedIssueEventRename({required this.from, required this.to});

  /// Converts a `Map<String, dynamic>` to a [RenamedIssueEventRename].
  factory RenamedIssueEventRename.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RenamedIssueEventRename',
      json,
      () => RenamedIssueEventRename(
        from: json['from'] as String,
        to: json['to'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RenamedIssueEventRename? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RenamedIssueEventRename.fromJson(json);
  }

  final String from;
  final String to;

  /// Converts a [RenamedIssueEventRename] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'from': from, 'to': to};
  }

  @override
  int get hashCode => Object.hashAll([from, to]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RenamedIssueEventRename &&
        from == other.from &&
        to == other.to;
  }
}
