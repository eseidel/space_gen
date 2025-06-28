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
}
