// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PagesHttpsCertificate', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PagesHttpsCertificate(
        state: PagesHttpsCertificateState.new_,
        description: 'Certificate is approved',
        domains: <String>['example'],
      );
      final parsed = PagesHttpsCertificate.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PagesHttpsCertificate.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PagesHttpsCertificate.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
