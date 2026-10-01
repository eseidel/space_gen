// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:github/models/reactions_create_for_release_request_content.dart';
import 'package:meta/meta.dart';

@immutable
class ReactionsCreateForReleaseRequest {
  const ReactionsCreateForReleaseRequest({required this.content});

  /// Converts a `Map<String, dynamic>` to a [ReactionsCreateForReleaseRequest].
  factory ReactionsCreateForReleaseRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReactionsCreateForReleaseRequest',
      json,
      () => ReactionsCreateForReleaseRequest(
        content: ReactionsCreateForReleaseRequestContent.fromJson(
          json['content'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReactionsCreateForReleaseRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReactionsCreateForReleaseRequest.fromJson(json);
  }

  /// The [reaction
  /// type](https://docs.github.com/rest/reactions/reactions#about-reactions)
  /// to add to the release.
  final ReactionsCreateForReleaseRequestContent content;

  /// Converts a [ReactionsCreateForReleaseRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'content': content.toJson()};
  }

  @override
  int get hashCode => content.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReactionsCreateForReleaseRequest &&
        content == other.content;
  }
}
