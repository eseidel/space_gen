import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GithubCheckApp {
  const GithubCheckApp({required this.name});

  /// Converts a `Map<String, dynamic>` to a [GithubCheckApp].
  factory GithubCheckApp.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GithubCheckApp',
      json,
      () => GithubCheckApp(name: json['name'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GithubCheckApp? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GithubCheckApp.fromJson(json);
  }

  final String name;

  /// Converts a [GithubCheckApp] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GithubCheckApp && name == other.name;
  }
}
