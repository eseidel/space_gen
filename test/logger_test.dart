import 'package:mason_logger/mason_logger.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:test/test.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  group('logger', () {
    test('error', () {
      final logger = MockLogger();
      runWithLogger(logger, () {
        error('test message');
      });
      verify(() => logger.err('test message')).called(1);
    });
  });
}
