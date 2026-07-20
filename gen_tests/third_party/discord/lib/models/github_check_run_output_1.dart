import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GithubCheckRunOutput1 {
  GithubCheckRunOutput1({this.title, this.summary}) {
    title?.validate(maxLength: 152133);
    summary?.validate(maxLength: 152133);
  }

  /// Converts a `Map<String, dynamic>` to a [GithubCheckRunOutput1].
  factory GithubCheckRunOutput1.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubCheckRunOutput1',
      json,
      () => GithubCheckRunOutput1(
        title: json['title'] as String?,
        summary: json['summary'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubCheckRunOutput1? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubCheckRunOutput1.fromJson(json);
  }

  final String? title;
  final String? summary;

  /// Converts a [GithubCheckRunOutput1] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'title': title, 'summary': summary};
  }

  @override
  int get hashCode => Object.hashAll([title, summary]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubCheckRunOutput1 &&
        title == other.title &&
        summary == other.summary;
  }
}
