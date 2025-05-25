import 'package:collection/collection.dart';

bool listsEqual<T>(List<T>? a, List<T>? b) {
  final deepEquals = const DeepCollectionEquality().equals;
  return deepEquals(a, b);
}

bool mapsEqual<K, V>(Map<K, V>? a, Map<K, V>? b) {
  final deepEquals = const DeepCollectionEquality().equals;
  return deepEquals(a, b);
}
