import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class FileCommitCommitAuthor {
  const FileCommitCommitAuthor({this.date, this.name, this.email});

  /// Converts a `Map<String, dynamic>` to a [FileCommitCommitAuthor].
  factory FileCommitCommitAuthor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileCommitCommitAuthor',
      json,
      () => FileCommitCommitAuthor(
        date: json['date'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileCommitCommitAuthor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FileCommitCommitAuthor.fromJson(json);
  }

  final String? date;
  final String? name;
  final String? email;

  /// Converts a [FileCommitCommitAuthor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (date != null) 'date': date,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
    };
  }

  @override
  int get hashCode => Object.hashAll([date, name, email]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileCommitCommitAuthor &&
        date == other.date &&
        name == other.name &&
        email == other.email;
  }
}
