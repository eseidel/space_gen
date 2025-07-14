import 'package:file/local.dart';
import 'package:space_gen/src/render/templates.dart';
import 'package:test/test.dart';

void main() {
  group('TemplateProvider', () {
    test('throws an exception if the template does not exist', () {
      final templateProvider = TemplateProvider.defaultLocation();
      expect(
        () => templateProvider.loadTemplate('does_not_exist'),
        throwsA(isA<Exception>()),
      );
    });

    test('throws exception if directory does not exist', () {
      expect(
        () => TemplateProvider.fromDirectory(
          const LocalFileSystem().directory('does_not_exist'),
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
