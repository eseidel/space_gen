import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';

/// {@template problem}
/// A problem detail object as defined in RFC 7807.
/// {@endtemplate}
@immutable
class Problem {
  /// {@macro problem}
  const Problem({
    this.type,
    this.title,
    this.detail,
    this.instance,
    this.status,
  });

  /// Converts a `Map<String, dynamic>` to a [Problem].
  factory Problem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Problem',
      json,
      () => Problem(
        type: json['type'] as String?,
        title: json['title'] as String?,
        detail: json['detail'] as String?,
        instance: json['instance'] as String?,
        status: json['status'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Problem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Problem.fromJson(json);
  }

  /// A URI reference that identifies the problem type
  /// Example: `'https://example.com/probs/out-of-credit'`
  final String? type;

  /// A short, human-readable summary of the problem type
  /// Example: `'You do not have enough credit.'`
  final String? title;

  /// A human-readable explanation specific to this occurrence of the problem
  /// Example: `'Your current balance is 30, but that costs 50.'`
  final String? detail;

  /// A URI reference that identifies the specific occurrence of the problem
  /// Example: `'/account/12345/msgs/abc'`
  final String? instance;

  /// The HTTP status code
  /// Example: `400`
  final int? status;

  /// Converts a [Problem] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': ?type,
      'title': ?title,
      'detail': ?detail,
      'instance': ?instance,
      'status': ?status,
    };
  }

  @override
  int get hashCode => Object.hashAll([type, title, detail, instance, status]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Problem &&
        type == other.type &&
        title == other.title &&
        detail == other.detail &&
        instance == other.instance &&
        status == other.status;
  }
}
