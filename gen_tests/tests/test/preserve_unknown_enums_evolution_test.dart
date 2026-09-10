// Spec v1 (the generated client): Status = open|closed, Priority = 1|2.
// See gen_tests/preserve_unknown_enums.json.
// Spec v2 (server, not regenerated): adds Status pending and Priority 3.
// A client generated with --preserve-unknown-enums from v1 must parse
// v2 JSON without throwing and round-trip the unknown tokens so GET then
// PUT does not overwrite them.
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:preserve_unknown_enums/api.dart';
import 'package:test/test.dart';

const v2Json = <String, dynamic>{'status': 'pending', 'priority': 3};

String describeStatus(Status status) {
  return switch (status) {
    StatusKnown.open => 'open',
    StatusKnown.closed => 'closed',
    StatusUnknown(:final raw) => 'unknown:$raw',
  };
}

void main() {
  group('spec evolution: v1 client, v2 enum values', () {
    test('Item.fromJson accepts values added in spec v2', () {
      final item = Item.fromJson(v2Json);
      expect(item.status, const StatusUnknown('pending'));
      expect(item.priority.toJson(), 3);
    });

    test('Item.toJson preserves unknown tokens for GET-then-PUT', () {
      final item = Item.fromJson(v2Json);
      expect(item.toJson(), v2Json);
    });

    test('known v1 values still parse', () {
      final item = Item.fromJson(<String, dynamic>{
        'status': 'open',
        'priority': 1,
      });
      expect(item.status, Status.open);
      expect(item.priority, const Priority(1));
    });

    test('exhaustive Status switch treats v2 tokens as unknown', () {
      expect(describeStatus(Status.fromJson('pending')), 'unknown:pending');
      expect(describeStatus(Status.open), 'open');
      expect(describeStatus(Status.closed), 'closed');
    });

    test('DefaultApi.getItem parses a v2 response', () async {
      final api = DefaultApi(
        ApiClient(
          client: MockClient((request) async {
            return Response(jsonEncode(v2Json), 200);
          }),
        ),
      );
      final item = await api.getItem();
      expect(item.status, const StatusUnknown('pending'));
      expect(item.priority.toJson(), 3);
      expect(item.toJson(), v2Json);
    });
  });
}
