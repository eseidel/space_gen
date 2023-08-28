import 'package:mason_logger/mason_logger.dart';
import 'package:space_gen/space_gen.dart';

final logger = Logger();

void main(List<String> arguments) async {
  final spec =
      await Spec.load(Uri.parse('../api-docs/reference/SpaceTraders.json'));
  for (final endpoint in spec.endpoints) {
    logger.info('${endpoint.tag} ${endpoint.method} ${endpoint.path}');
  }
}
