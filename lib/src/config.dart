import 'package:file/file.dart';
import 'package:yaml/yaml.dart';

class Config {
  Config({
    required this.specUri,
    required this.outDir,
    required this.packageName,
  });

  final Uri specUri;
  final Directory outDir;
  final String packageName;
}

String _requiredValue(YamlMap yaml, String name) {
  final value = yaml[name];
  if (value is String) {
    return value;
  }
  throw ArgumentError.value(value, name, 'Expected a string');
}

Uri resolveRelativeUri(File config, String relativePath) {
  final configUri = Uri.file(config.path);
  return configUri.resolve(relativePath);
}

String resolveRelativePath(File config, String relativePath) {
  return resolveRelativeUri(config, relativePath).path;
}

Config loadFromFile(File config) {
  final yaml = loadYaml(config.readAsStringSync()) as YamlMap;
  // Using the same names as openapi-generator-cli
  // https://github.com/OpenAPITools/openapi-generator/blob/master/docs/configuration.md
  // https://github.com/OpenAPITools/openapi-generator/blob/master/docs/generators/dart.md
  final inputSpec = resolveRelativeUri(
    config,
    _requiredValue(yaml, 'inputSpec'),
  );
  final outputDir = config.fileSystem.directory(
    resolveRelativePath(config, _requiredValue(yaml, 'outputDir')),
  );
  final packageName = _requiredValue(yaml, 'pubName');
  return Config(
    specUri: inputSpec,
    outDir: outputDir,
    packageName: packageName,
  );
}
