import 'package:github/model_helpers.dart';
import 'package:github/models/markdown_render_request_mode.dart';
import 'package:meta/meta.dart';

@immutable
class MarkdownRenderRequest {
  const MarkdownRenderRequest({
    required this.text,
    this.mode = MarkdownRenderRequestMode.markdown,
    this.context,
  });

  /// Converts a `Map<String, dynamic>` to a [MarkdownRenderRequest].
  factory MarkdownRenderRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MarkdownRenderRequest',
      json,
      () => MarkdownRenderRequest(
        text: json['text'] as String,
        mode:
            MarkdownRenderRequestMode.maybeFromJson(json['mode'] as String?) ??
            MarkdownRenderRequestMode.markdown,
        context: json['context'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MarkdownRenderRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MarkdownRenderRequest.fromJson(json);
  }

  /// The Markdown text to render in HTML.
  final String text;

  /// The rendering mode.
  /// Example: `'markdown'`
  final MarkdownRenderRequestMode? mode;

  /// The repository context to use when creating references in `gfm` mode.
  /// For example, setting `context` to `octo-org/octo-repo` will change the
  /// text `#42` into an HTML link to issue 42 in the `octo-org/octo-repo`
  /// repository.
  final String? context;

  /// Converts a [MarkdownRenderRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'text': text, 'mode': mode?.toJson(), 'context': context};
  }

  @override
  int get hashCode => Object.hashAll([text, mode, context]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MarkdownRenderRequest &&
        text == other.text &&
        mode == other.mode &&
        context == other.context;
  }
}
