import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BillingUsageReportUserUsageItemsInner {
  const BillingUsageReportUserUsageItemsInner({
    required this.date,
    required this.product,
    required this.sku,
    required this.quantity,
    required this.unitType,
    required this.pricePerUnit,
    required this.grossAmount,
    required this.discountAmount,
    required this.netAmount,
    this.repositoryName,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [BillingUsageReportUserUsageItemsInner].
  factory BillingUsageReportUserUsageItemsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BillingUsageReportUserUsageItemsInner',
      json,
      () => BillingUsageReportUserUsageItemsInner(
        date: json['date'] as String,
        product: json['product'] as String,
        sku: json['sku'] as String,
        quantity: json['quantity'] as int,
        unitType: json['unitType'] as String,
        pricePerUnit: (json['pricePerUnit'] as num).toDouble(),
        grossAmount: (json['grossAmount'] as num).toDouble(),
        discountAmount: (json['discountAmount'] as num).toDouble(),
        netAmount: (json['netAmount'] as num).toDouble(),
        repositoryName: json['repositoryName'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BillingUsageReportUserUsageItemsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BillingUsageReportUserUsageItemsInner.fromJson(json);
  }

  /// Date of the usage line item.
  final String date;

  /// Product name.
  final String product;

  /// SKU name.
  final String sku;

  /// Quantity of the usage line item.
  final int quantity;

  /// Unit type of the usage line item.
  final String unitType;

  /// Price per unit of the usage line item.
  final double pricePerUnit;

  /// Gross amount of the usage line item.
  final double grossAmount;

  /// Discount amount of the usage line item.
  final double discountAmount;

  /// Net amount of the usage line item.
  final double netAmount;

  /// Name of the repository.
  final String? repositoryName;

  /// Converts a [BillingUsageReportUserUsageItemsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'product': product,
      'sku': sku,
      'quantity': quantity,
      'unitType': unitType,
      'pricePerUnit': pricePerUnit,
      'grossAmount': grossAmount,
      'discountAmount': discountAmount,
      'netAmount': netAmount,
      'repositoryName': repositoryName,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    date,
    product,
    sku,
    quantity,
    unitType,
    pricePerUnit,
    grossAmount,
    discountAmount,
    netAmount,
    repositoryName,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BillingUsageReportUserUsageItemsInner &&
        date == other.date &&
        product == other.product &&
        sku == other.sku &&
        quantity == other.quantity &&
        unitType == other.unitType &&
        pricePerUnit == other.pricePerUnit &&
        grossAmount == other.grossAmount &&
        discountAmount == other.discountAmount &&
        netAmount == other.netAmount &&
        repositoryName == other.repositoryName;
  }
}
