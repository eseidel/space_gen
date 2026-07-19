// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template license}
/// License
/// License
/// {@endtemplate}
@immutable
class License {
  /// {@macro license}
  const License({
    required this.key,
    required this.name,
    required this.spdxId,
    required this.url,
    required this.nodeId,
    required this.htmlUrl,
    required this.description,
    required this.implementation,
    required this.permissions,
    required this.conditions,
    required this.limitations,
    required this.body,
    required this.featured,
  });

  /// Converts a `Map<String, dynamic>` to a [License].
  factory License.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'License',
      json,
      () => License(
        key: json['key'] as String,
        name: json['name'] as String,
        spdxId: checkedKey(json, 'spdx_id') as String?,
        url: maybeParseUri(checkedKey(json, 'url') as String?),
        nodeId: json['node_id'] as String,
        htmlUrl: Uri.parse(json['html_url'] as String),
        description: json['description'] as String,
        implementation: json['implementation'] as String,
        permissions: (json['permissions'] as List).cast<String>(),
        conditions: (json['conditions'] as List).cast<String>(),
        limitations: (json['limitations'] as List).cast<String>(),
        body: json['body'] as String,
        featured: json['featured'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static License? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return License.fromJson(json);
  }

  /// Example: `'mit'`
  final String key;

  /// Example: `'MIT License'`
  final String name;

  /// Example: `'MIT'`
  final String? spdxId;

  /// Example: `'https://api.github.com/licenses/mit'`
  final Uri? url;

  /// Example: `'MDc6TGljZW5zZW1pdA=='`
  final String nodeId;

  /// Example: `'http://choosealicense.com/licenses/mit/'`
  final Uri htmlUrl;

  /// Example: `'A permissive license that is short and to the point. It lets people do anything with your code with proper attribution and without warranty.'`
  final String description;

  /// Example: `'Create a text file (typically named LICENSE or LICENSE.txt) in the root of your source code and copy the text of the license into the file. Replace [year] with the current year and [fullname] with the name (or names) of the copyright holders.'`
  final String implementation;

  /// Example: `'commercial-use'`
  /// Example: `'modifications'`
  /// Example: `'distribution'`
  /// Example: `'sublicense'`
  /// Example: `'private-use'`
  final List<String> permissions;

  /// Example: `'include-copyright'`
  final List<String> conditions;

  /// Example: `'no-liability'`
  final List<String> limitations;

  /// Example: `'\n\nThe MIT License (MIT)\n\nCopyright (c) [year] [fullname]\n\nPermission is hereby granted, free of charge, to any person obtaining a copy\nof this software and associated documentation files (the "Software"), to deal\nin the Software without restriction, including without limitation the rights\nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell\ncopies of the Software, and to permit persons to whom the Software is\nfurnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all\ncopies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\nIMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\nFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\nAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\nLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\nOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\nSOFTWARE.\n'`
  final String body;

  /// Example: `true`
  final bool featured;

  /// Converts a [License] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'spdx_id': spdxId,
      'url': url?.toString(),
      'node_id': nodeId,
      'html_url': htmlUrl.toString(),
      'description': description,
      'implementation': implementation,
      'permissions': permissions,
      'conditions': conditions,
      'limitations': limitations,
      'body': body,
      'featured': featured,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    key,
    name,
    spdxId,
    url,
    nodeId,
    htmlUrl,
    description,
    implementation,
    listHash(permissions),
    listHash(conditions),
    listHash(limitations),
    body,
    featured,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is License &&
        key == other.key &&
        name == other.name &&
        spdxId == other.spdxId &&
        url == other.url &&
        nodeId == other.nodeId &&
        htmlUrl == other.htmlUrl &&
        description == other.description &&
        implementation == other.implementation &&
        listsEqual(permissions, other.permissions) &&
        listsEqual(conditions, other.conditions) &&
        listsEqual(limitations, other.limitations) &&
        body == other.body &&
        featured == other.featured;
  }
}
