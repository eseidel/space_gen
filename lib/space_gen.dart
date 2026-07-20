import 'package:space_gen/src/logger.dart' as logging;
import 'package:space_gen/src/parse/spec.dart' show OpenApi;
import 'package:space_gen/src/parser.dart' as parser;

export 'src/cli.dart' show runCli;
export 'src/logger.dart' show Logger, logger, runWithLogger, setVerboseLogging;
export 'src/parse/spec.dart';
export 'src/quirks.dart' show Quirks;
export 'src/render.dart'
    show
        FileRendererBuilder,
        GeneratorConfig,
        SpecParserConfig,
        loadAndRenderSpec,
        loadRenderSpec;
// Experimental: hooks for custom file layouts. Consumers subclass
// [FileRenderer] in their own generator entrypoint and override the
// `@protected` hooks — see `tool/gen_shorebird.dart` for an example.
// The collaborators bundled inside [FileRendererConfig] are
// constructed by [loadAndRenderSpec] and threaded through to the
// subclass via `super(config)`, so their concrete types aren't part
// of the exported surface.
export 'src/render/file_renderer.dart'
    show FileRenderer, FileRendererConfig, LayoutContext, collectAllSchemas;
export 'src/render/render_tree.dart';
export 'src/types.dart' show JsonPointer, Method, ParameterLocation, PodType;

OpenApi parseOpenApi(Map<String, dynamic> openapiJson) {
  return logging.runWithDefaultLogger(() => parser.parseOpenApi(openapiJson));
}
