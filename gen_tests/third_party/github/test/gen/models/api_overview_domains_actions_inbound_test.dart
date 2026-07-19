// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApiOverviewDomainsActionsInbound', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApiOverviewDomainsActionsInbound();
      final parsed = ApiOverviewDomainsActionsInbound.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApiOverviewDomainsActionsInbound.maybeFromJson(null), isNull);
    });
  });
}
