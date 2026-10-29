import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GithubCheckRunOutput {
  GithubCheckRunOutput({this.title, this.summary}) {
    title?.validate(maxLength: 152133);
    summary?.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubCheckRunOutput].
  factory GithubCheckRunOutput.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubCheckRunOutput',
      json,
      () => GithubCheckRunOutput(
        title: json['title'] as String?,
        summary: json['summary'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubCheckRunOutput? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubCheckRunOutput.fromJson(json);
  }

  final String? title;
  final String? summary;

  /// Converts a [GithubCheckRunOutput] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': title, 'summary': summary};
  }

  @override
  int get hashCode => Object.hashAll([title, summary]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubCheckRunOutput &&
        title == other.title &&
        summary == other.summary;
  }
}
