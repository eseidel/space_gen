import 'dart:io';

import 'package:yaml/yaml.dart';

class Config {
  Config({
    required this.specUri,
    required this.outDirPath,
    required this.packageName,
  });

  final Uri specUri;
  final String outDirPath;
  final String packageName;
}

String _requiredValue(YamlMap yaml, String name) {
  final value = yaml[name];
  if (value is String) {
    return value;
  }
  throw ArgumentError.value(value, name, 'Expected a string');
}

Uri resolveRelativeUri(String configPath, String relativePath) {
  final configUri = Uri.parse(configPath);
  return configUri.resolve(relativePath);
}

String resolveRelativePath(String configPath, String relativePath) {
  return resolveRelativeUri(configPath, relativePath).path;
}

Config loadFromFile(String configPath) {
  final file = File(configPath);
  final yaml = loadYaml(file.readAsStringSync()) as YamlMap;
  // Using the same names as openapi-generator-cli
  // https://github.com/OpenAPITools/openapi-generator/blob/master/docs/configuration.md
  // https://github.com/OpenAPITools/openapi-generator/blob/master/docs/generators/dart.md
  final inputSpec =
      resolveRelativeUri(configPath, _requiredValue(yaml, 'inputSpec'));
  final outputDir =
      resolveRelativePath(configPath, _requiredValue(yaml, 'outputDir'));
  final packageName = _requiredValue(yaml, 'pubName');
  return Config(
    specUri: inputSpec,
    outDirPath: outputDir,
    packageName: packageName,
  );
}
