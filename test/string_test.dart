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

  test('toSnakeCase', () {
    expect(toSnakeCase('snakeFromCamel'), 'snake_from_camel');
    expect(toSnakeCase('SnakeFromCamel'), 'snake_from_camel');
    expect(toSnakeCase('snake_from_camel'), 'snake_from_camel');
    expect(toSnakeCase('Snake_from_camel'), 'snake_from_camel');
    expect(toSnakeCase('snakeFromCamel'), 'snake_from_camel');
    expect(toSnakeCase('snake-from-camel'), 'snake_from_camel');
  });

  test('camelFromSnake', () {
    expect(camelFromSnake('camel_from_snake'), 'CamelFromSnake');
    expect(camelFromSnake('Camel_from_snake'), 'CamelFromSnake');
    expect(camelFromSnake('camel_from_snake'), 'CamelFromSnake');
    expect(camelFromSnake('Camel_from_snake'), 'CamelFromSnake');
  });

  test('toLowerCamelCase', () {
    expect(toLowerCamelCase('CAMEL_FROM_CAPS'), 'camelFromCaps');
    expect(toLowerCamelCase('camel_from_caps'), 'camelFromCaps');
    expect(toLowerCamelCase('camelFromCaps'), 'camelFromCaps');
    expect(toLowerCamelCase('camel-from-caps'), 'camelFromCaps');
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
