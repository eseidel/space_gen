import 'package:collection/collection.dart';

/// Check if two nullable lists are deeply equal.
bool listsEqual<T>(List<T>? a, List<T>? b) {
  final deepEquals = const DeepCollectionEquality().equals;
  return deepEquals(a, b);
}

/// A deep hash of a nullable list — consistent with [listsEqual].
/// Two lists that compare equal under [listsEqual] produce the same
/// hash. Null hashes to 0.
int listHash<T>(List<T>? list) {
  if (list == null) return 0;
  return const DeepCollectionEquality().hash(list);
}
