// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesAddAssigneesRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesAddAssigneesRequest();
      final parsed = IssuesAddAssigneesRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssuesAddAssigneesRequest.maybeFromJson(null), isNull);
    });
  });
}
