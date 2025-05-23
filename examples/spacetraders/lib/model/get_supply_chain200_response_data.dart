import 'package:spacetraders/model/get_supply_chain200_response_data_export_to_import_map.dart';

class GetSupplyChain200ResponseData {
  GetSupplyChain200ResponseData({required this.exportToImportMap});

  factory GetSupplyChain200ResponseData.fromJson(Map<String, dynamic> json) {
    return GetSupplyChain200ResponseData(
      exportToImportMap:
          GetSupplyChain200ResponseDataExportToImportMap.fromJson(
            json['exportToImportMap'] as Map<String, dynamic>,
          ),
    );
  }

  final GetSupplyChain200ResponseDataExportToImportMap exportToImportMap;

  Map<String, dynamic> toJson() {
    return {'exportToImportMap': exportToImportMap.toJson()};
  }
}
