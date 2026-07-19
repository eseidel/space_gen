import 'package:github/model_helpers.dart';
import 'package:github/models/git_create_tag_request_tagger.dart';
import 'package:github/models/git_create_tag_request_type.dart';
import 'package:meta/meta.dart';

@immutable
class GitCreateTagRequest {
  const GitCreateTagRequest({
    required this.tag,
    required this.message,
    required this.object,
    required this.type,
    this.tagger,
  });

  /// Converts a `Map<String, dynamic>` to a [GitCreateTagRequest].
  factory GitCreateTagRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCreateTagRequest',
      json,
      () => GitCreateTagRequest(
        tag: json['tag'] as String,
        message: json['message'] as String,
        object: json['object'] as String,
        type: GitCreateTagRequestType.fromJson(json['type'] as String),
        tagger: GitCreateTagRequestTagger.maybeFromJson(
          json['tagger'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCreateTagRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitCreateTagRequest.fromJson(json);
  }

  /// The tag's name. This is typically a version (e.g., "v0.0.1").
  final String tag;

  /// The tag message.
  final String message;

  /// The SHA of the git object this is tagging.
  final String object;

  /// The type of the object we're tagging. Normally this is a `commit` but it
  /// can also be a `tree` or a `blob`.
  final GitCreateTagRequestType type;

  /// An object with information about the individual creating the tag.
  final GitCreateTagRequestTagger? tagger;

  /// Converts a [GitCreateTagRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'tag': tag,
      'message': message,
      'object': object,
      'type': type.toJson(),
      if (tagger != null) 'tagger': tagger?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([tag, message, object, type, tagger]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCreateTagRequest &&
        tag == other.tag &&
        message == other.message &&
        object == other.object &&
        type == other.type &&
        tagger == other.tagger;
  }
}
