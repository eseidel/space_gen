// Example consumer entrypoint for space_gen.
//
// Plugs a custom [FileRenderer] into the standard [runCli] shell.
// This matches Shorebird's hand-written
// `shorebird_code_push_protocol` package layout: request/response
// DTOs owned by a single operation nest under a per-operation
// directory, domain models land in `lib/models/`, shared messages
// stay flat.
//
// Treat the space_gen extension surface used here (`runCli`,
// `FileRendererBuilder`, the `@protected` hooks on `FileRenderer`)
// as a preview — names and shape may still change.
//
// Usage:
//   dart run tool/gen_shorebird.dart -i codepush.yaml -o codepush_out

import 'package:space_gen/space_gen.dart';

class ShorebirdFileRenderer extends FileRenderer {
  ShorebirdFileRenderer(super.config);

  @override
  String modelPath(LayoutContext context) {
    final snakeName = context.schema.snakeName;
    final className = context.schema.typeName;
    final isMessage =
        className.endsWith('Request') || className.endsWith('Response');
    if (!isMessage) return 'models/$snakeName.dart';
    final base = _messageBaseName(snakeName);
    if (context.operationSnakeNames.contains(base)) {
      return 'messages/$base/$snakeName.dart';
    }
    return 'messages/$snakeName.dart';
  }

  /// Strip a trailing `_request`/`_response` (and any HTTP status code
  /// inline-schema suffix like `200_response`) from [snake], returning
  /// the operation-name portion. Non-matching input is returned as-is.
  static String _messageBaseName(String snake) {
    for (final suffix in const ['_request', '_response']) {
      if (snake.endsWith(suffix)) {
        var base = snake.substring(0, snake.length - suffix.length);
        final match = RegExp(r'\d+$').firstMatch(base);
        if (match != null) {
          base = base.substring(0, match.start);
        }
        return base;
      }
    }
    return snake;
  }
}

Future<int> main(List<String> arguments) =>
    runCli(arguments, fileRendererBuilder: ShorebirdFileRenderer.new);
