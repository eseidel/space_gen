import 'package:space_gen/templates/api_exception.dart';
import 'package:test/test.dart';

// The `validate` extensions ship verbatim into every generated package,
// where the round-trip suites exercise them indirectly. These tests pin the
// behavior — and the exact messages — in space_gen's own suite.
void main() {
  Matcher throwsMessage(String message) => throwsA(
    isA<Exception>().having((e) => e.toString(), 'message', contains(message)),
  );

  group('ValidateNumber', () {
    test('validate is sugar over the single-rule checks', () {
      // Every bound satisfied → no throw.
      3.validate(min: 1, max: 10, multipleOf: 1);
      // Each bound, when violated, surfaces its rule's message.
      expect(() => 0.validate(min: 1), throwsMessage('greater than or equal'));
      expect(() => 11.validate(max: 10), throwsMessage('less than or equal'));
      expect(
        () => 0.validate(exclusiveMin: 0),
        throwsMessage('greater than 0'),
      );
      expect(() => 5.validate(exclusiveMax: 5), throwsMessage('less than 5'));
      expect(() => 5.validate(multipleOf: 2), throwsMessage('multiple of 2'));
      // Absent arguments are skipped.
      1000.validate();
    });

    test('single-rule methods each guard their own bound', () {
      2.validateMinimum(2);
      expect(
        () => 1.validateMinimum(2),
        throwsMessage('greater than or equal to 2'),
      );
      5.validateMaximum(5);
      expect(
        () => 6.validateMaximum(5),
        throwsMessage('less than or equal to 5'),
      );
      2.validateExclusiveMinimum(1);
      expect(
        () => 1.validateExclusiveMinimum(1),
        throwsMessage('greater than 1'),
      );
      4.validateExclusiveMaximum(5);
      expect(() => 5.validateExclusiveMaximum(5), throwsMessage('less than 5'));
      6.validateMultipleOf(3);
      expect(() => 7.validateMultipleOf(3), throwsMessage('multiple of 3'));
    });

    test('validateEnumValues accepts a member and rejects a non-member', () {
      3.validateEnumValues([3, 4]);
      // Out-of-set is a parse failure, so it throws FormatException.
      expect(
        () => 5.validateEnumValues([3, 4]),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('5 is not one of [3, 4]'),
          ),
        ),
      );
    });
  });

  group('ValidateString', () {
    test('validate is sugar over the single-rule checks', () {
      'abc'.validate(minLength: 1, maxLength: 5, pattern: r'^[a-z]+$');
      expect(() => ''.validate(minLength: 1), throwsMessage('at least 1'));
      expect(
        () => 'hello'.validate(maxLength: 3),
        throwsMessage('at most 3'),
      );
      expect(
        () => 'ABC'.validate(pattern: r'^[a-z]+$'),
        throwsMessage('must match the pattern'),
      );
      'anything'.validate();
    });

    test('single-rule methods each guard their own bound', () {
      'ab'.validateMinimumLength(2);
      expect(() => 'a'.validateMinimumLength(2), throwsMessage('at least 2'));
      'ab'.validateMaximumLength(2);
      expect(() => 'abc'.validateMaximumLength(2), throwsMessage('at most 2'));
      'abc'.validatePattern(r'^[a-z]+$');
      expect(
        () => '123'.validatePattern(r'^[a-z]+$'),
        throwsMessage('must match the pattern'),
      );
    });
  });

  group('ValidateArray', () {
    test('validate is sugar over the single-rule checks', () {
      [1, 2].validate(minItems: 1, maxItems: 3, unique: true);
      expect(() => <int>[].validate(minItems: 1), throwsMessage('at least 1'));
      expect(
        () => [1, 2, 3].validate(maxItems: 2),
        throwsMessage('at most 2'),
      );
      expect(
        () => [1, 1].validate(unique: true),
        throwsMessage('unique items'),
      );
      // `unique: false` (the default) skips the uniqueness check.
      [1, 1].validate();
    });

    test('single-rule methods each guard their own bound', () {
      [1, 2].validateMinimumItems(2);
      expect(() => [1].validateMinimumItems(2), throwsMessage('at least 2'));
      [1, 2].validateMaximumItems(2);
      expect(
        () => [1, 2, 3].validateMaximumItems(2),
        throwsMessage('at most 2'),
      );
      [1, 2, 3].validateUniqueItems();
      expect(() => [1, 1].validateUniqueItems(), throwsMessage('unique items'));
    });
  });
}
