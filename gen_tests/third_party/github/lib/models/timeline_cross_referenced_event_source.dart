import 'package:github/model_helpers.dart';
import 'package:github/models/issue.dart';
import 'package:meta/meta.dart';

@immutable
class TimelineCrossReferencedEventSource {
  const TimelineCrossReferencedEventSource({this.type, this.issue});

  /// Converts a `Map<String, dynamic>` to a
  /// [TimelineCrossReferencedEventSource].
  factory TimelineCrossReferencedEventSource.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'TimelineCrossReferencedEventSource',
      json,
      () => TimelineCrossReferencedEventSource(
        type: json['type'] as String?,
        issue: Issue.maybeFromJson(json['issue'] as Map<String, dynamic>?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineCrossReferencedEventSource? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return TimelineCrossReferencedEventSource.fromJson(json);
  }

  final String? type;

  /// Issue
  /// Issues are a great way to keep track of tasks, enhancements, and bugs
  /// for your projects.
  final Issue? issue;

  /// Converts a [TimelineCrossReferencedEventSource]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type, 'issue': issue?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, issue]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineCrossReferencedEventSource &&
        type == other.type &&
        issue == other.issue;
  }
}
