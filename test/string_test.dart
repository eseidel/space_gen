import 'package:space_gen/src/string.dart';
import 'package:test/test.dart';

void main() {
  test('snakeFromCamel', () {
    expect(snakeFromCamel('snakeFromCamel'), 'snake_from_camel');
    expect(snakeFromCamel('SnakeFromCamel'), 'snake_from_camel');
    expect(snakeFromCamel('snake_from_camel'), 'snake_from_camel');
    expect(snakeFromCamel('Snake_from_camel'), 'snake_from_camel');
    expect(snakeFromCamel('snakeFromCamel'), 'snake_from_camel');
  });

  test('camelFromScreamingCaps', () {
    expect(camelFromScreamingCaps('CAMEL_FROM_CAPS'), 'camelFromCaps');
    expect(camelFromScreamingCaps('camel_from_caps'), 'camelFromCaps');
  });

  test('isReservedWord', () {
    expect(isReservedWord('void'), true);
    expect(isReservedWord('int'), true);
    expect(isReservedWord('double'), true);
    expect(isReservedWord('num'), true);
    expect(isReservedWord('bool'), true);
    expect(isReservedWord('dynamic'), true);
    expect(isReservedWord('String'), false);
    expect(isReservedWord('string'), false);
    expect(isReservedWord('String'), false);
    expect(isReservedWord('string'), false);
  });
}
