// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
