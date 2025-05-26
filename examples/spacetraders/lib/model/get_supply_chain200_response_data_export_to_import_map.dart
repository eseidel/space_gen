import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetSupplyChain200ResponseDataExportToImportMap {
  const GetSupplyChain200ResponseDataExportToImportMap({required this.entries});

  factory GetSupplyChain200ResponseDataExportToImportMap.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetSupplyChain200ResponseDataExportToImportMap(
      entries: json.map(
        (key, value) => MapEntry(key, (value as List).cast<String>()),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSupplyChain200ResponseDataExportToImportMap? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetSupplyChain200ResponseDataExportToImportMap.fromJson(json);
  }

  final Map<String, List<String>> entries;

  List<String>? operator [](String key) => entries[key];

  Map<String, dynamic> toJson() {
    return {...entries.map(MapEntry.new)};
  }

  @override
  int get hashCode => entries.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetSupplyChain200ResponseDataExportToImportMap &&
        mapsEqual(entries, other.entries);
  }
}
