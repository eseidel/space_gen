import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetSupplyChain200ResponseData {
  const GetSupplyChain200ResponseData({required this.exportToImportMap});

  /// Converts a `Map<String, dynamic>` to a [GetSupplyChain200ResponseData].
  factory GetSupplyChain200ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetSupplyChain200ResponseData',
      json,
      () => GetSupplyChain200ResponseData(
        exportToImportMap: (json['exportToImportMap'] as Map<String, dynamic>)
            .map((key, value) => MapEntry(key, (value as List).cast<String>())),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSupplyChain200ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetSupplyChain200ResponseData.fromJson(json);
  }

  final Map<String, List<String>> exportToImportMap;

  /// Converts a [GetSupplyChain200ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'exportToImportMap': exportToImportMap};
  }

  @override
  int get hashCode => mapHash(exportToImportMap).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetSupplyChain200ResponseData &&
        mapsEqual(exportToImportMap, other.exportToImportMap);
  }
}
