import 'package:space_gen/src/render.dart';
import 'package:test/test.dart';

void main() {
  test('validatePackageName', () {
    expect(() => validatePackageName(''), throwsA(isA<FormatException>()));
    expect(() => validatePackageName('123'), throwsA(isA<FormatException>()));
    expect(() => validatePackageName('a123'), returnsNormally);
    expect(() => validatePackageName('a_123'), returnsNormally);
    expect(
      () => validatePackageName('MyPackage'),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => validatePackageName('my-package'),
      throwsA(isA<FormatException>()),
    );
  });

  group('describeSpecUrl', () {
    test('file: URL becomes a path relative to the cwd', () {
      // Absolute path under cwd → empty relative path wouldn't be
      // meaningful, so use a sibling path to keep the check stable
      // regardless of where the test runs.
      final url = Uri.file('/tmp/spec.yaml');
      expect(describeSpecUrl(url), isNot(startsWith('file:')));
      expect(describeSpecUrl(url), endsWith('spec.yaml'));
    });

    test('non-file URL is rendered as-is', () {
      final url = Uri.parse('https://example.com/spec.yaml');
      expect(describeSpecUrl(url), 'https://example.com/spec.yaml');
    });
  });
}
