import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:mustache_template/mustache_template.dart';

class TemplateProvider {
  TemplateProvider.fromDirectory(this.templateDir) {
    if (!templateDir.existsSync()) {
      throw Exception('Template directory does not exist: ${templateDir.path}');
    }
  }

  TemplateProvider.defaultLocation()
    : templateDir = const LocalFileSystem().directory('lib/templates');

  final Directory templateDir;
  // Reading the same template from disk repeatedly is slow, so cache them.
  // Saves about 4s on rendering the GitHub spec.
  final Map<String, Template> _cache = {};

  Template load(String name) {
    return _cache.putIfAbsent(
      name,
      () => Template(
        templateDir.childFile('$name.mustache').readAsStringSync(),
        partialResolver: load,
        name: name,
      ),
    );
  }
}
