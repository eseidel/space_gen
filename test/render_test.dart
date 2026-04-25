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

  test('sanitizePackageName coerces to a valid Dart package name', () {
    // Already valid — no change.
    expect(sanitizePackageName('petstore'), 'petstore');
    expect(sanitizePackageName('a_123'), 'a_123');
    // Dots and dashes (common in spec filenames / output dirs).
    expect(sanitizePackageName('api.github.com'), 'api_github_com');
    expect(sanitizePackageName('my-package'), 'my_package');
    // Uppercase gets lowered.
    expect(sanitizePackageName('Package'), 'package');
    // Leading digits get a `p_` prefix.
    expect(sanitizePackageName('123_client'), 'p_123_client');
    // Leading underscores strip, not prefix.
    expect(sanitizePackageName('_client'), 'client');
    // Empty-after-sanitize falls back to a non-empty valid name.
    expect(sanitizePackageName('.'), 'p');
    expect(sanitizePackageName(''), 'p');
    // Result always passes validatePackageName.
    for (final raw in [
      'api.github.com',
      '123_client',
      '.',
      '_client',
      'Package',
    ]) {
      expect(
        () => validatePackageName(sanitizePackageName(raw)),
        returnsNormally,
      );
    }
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
