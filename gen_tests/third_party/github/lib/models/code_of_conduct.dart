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

/// {@template code_of_conduct}
/// Code Of Conduct
/// Code Of Conduct
/// {@endtemplate}
@immutable
class CodeOfConduct {
  /// {@macro code_of_conduct}
  const CodeOfConduct({
    required this.key,
    required this.name,
    required this.url,
    required this.htmlUrl,
    this.body,
  });

  /// Converts a `Map<String, dynamic>` to a [CodeOfConduct].
  factory CodeOfConduct.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CodeOfConduct',
      json,
      () => CodeOfConduct(
        key: json['key'] as String,
        name: json['name'] as String,
        url: Uri.parse(json['url'] as String),
        body: json['body'] as String?,
        htmlUrl: maybeParseUri(checkedKey(json, 'html_url') as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodeOfConduct? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodeOfConduct.fromJson(json);
  }

  /// Example: `'contributor_covenant'`
  final String key;

  /// Example: `'Contributor Covenant'`
  final String name;

  /// Example:
  /// `'https://api.github.com/codes_of_conduct/contributor_covenant'`
  final Uri url;

  /// Example: `'# Contributor Covenant Code of Conduct\n\n## Our Pledge\n\nIn the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.\n\n## Our Standards\n\nExamples of behavior that contributes to creating a positive environment include:\n\n* Using welcoming and inclusive language\n* Being respectful of differing viewpoints and experiences\n* Gracefully accepting constructive criticism\n* Focusing on what is best for the community\n* Showing empathy towards other community members\n\nExamples of unacceptable behavior by participants include:\n\n* The use of sexualized language or imagery and unwelcome sexual attention or advances\n* Trolling, insulting/derogatory comments, and personal or political attacks\n* Public or private harassment\n* Publishing others\' private information, such as a physical or electronic address, without explicit permission\n* Other conduct which could reasonably be considered inappropriate in a professional setting\n\n## Our Responsibilities\n\nProject maintainers are responsible for clarifying the standards of acceptable behavior and are expected to take appropriate and fair corrective action in response\n                  to any instances of unacceptable behavior.\n\nProject maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct, or to ban temporarily or permanently any contributor for other behaviors that they deem inappropriate, threatening, offensive, or harmful.\n\n## Scope\n\nThis Code of Conduct applies both within project spaces and in public spaces when an individual is representing the project or its community. Examples of representing a project or community include using an official project e-mail address,\n                  posting via an official social media account, or acting as an appointed representative at an online or offline event. Representation of a project may be further defined and clarified by project maintainers.\n\n## Enforcement\n\nInstances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting the project team at [EMAIL]. The project team will review and investigate all complaints, and will respond in a way that it deems appropriate to the circumstances. The project team is obligated to maintain confidentiality with regard to the reporter of an incident. Further details of specific enforcement policies may be posted separately.\n\nProject maintainers who do not follow or enforce the Code of Conduct in good faith may face temporary or permanent repercussions as determined by other members of the project\'s leadership.\n\n## Attribution\n\nThis Code of Conduct is adapted from the [Contributor Covenant](http://contributor-covenant.org), version 1.4, available at [http://contributor-covenant.org/version/1/4](http://contributor-covenant.org/version/1/4/).\n'`
  final String? body;
  final Uri? htmlUrl;

  /// Converts a [CodeOfConduct] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'url': url.toString(),
      'body': ?body,
      'html_url': htmlUrl?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([key, name, url, body, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeOfConduct &&
        key == other.key &&
        name == other.name &&
        url == other.url &&
        body == other.body &&
        htmlUrl == other.htmlUrl;
  }
}
