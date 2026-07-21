import 'package:github/models/content_directory_inner.dart';

/// Content Directory
/// A list of directory items
extension type const ContentDirectory._(List<ContentDirectoryInner> value)
    implements List<ContentDirectoryInner> {
  const ContentDirectory(this.value);

  factory ContentDirectory.fromJson(List<dynamic> json) => ContentDirectory(
    json
        .map<ContentDirectoryInner>(
          (e) => ContentDirectoryInner.fromJson(e as Map<String, dynamic>),
        )
        .toList(),
  );

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContentDirectory? maybeFromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContentDirectory.fromJson(json);
  }

  List<dynamic> toJson() => value.map((e) => e.toJson()).toList();
}
