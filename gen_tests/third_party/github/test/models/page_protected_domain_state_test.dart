// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PageProtectedDomainState', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PageProtectedDomainState.pending;
      final parsed = PageProtectedDomainState.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PageProtectedDomainState.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PageProtectedDomainState.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in PageProtectedDomainState.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in PageProtectedDomainState.values) {
        expect(
          PageProtectedDomainState.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
