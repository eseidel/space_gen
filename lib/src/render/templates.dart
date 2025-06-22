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

  Template load(String name) {
    return Template(
      templateDir.childFile('$name.mustache').readAsStringSync(),
      partialResolver: load,
      name: name,
    );
  }
}
