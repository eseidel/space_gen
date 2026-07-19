// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsGetActionsCacheUsageByRepoForOrg200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsGetActionsCacheUsageByRepoForOrg200Response(
        totalCount: 0,
        repositoryCacheUsages: <ActionsCacheUsageByRepository>[
          ActionsCacheUsageByRepository(
            fullName: 'octo-org/Hello-World',
            activeCachesSizeInBytes: 2322142,
            activeCachesCount: 3,
          ),
        ],
      );
      final parsed =
          ActionsGetActionsCacheUsageByRepoForOrg200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsGetActionsCacheUsageByRepoForOrg200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsGetActionsCacheUsageByRepoForOrg200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
