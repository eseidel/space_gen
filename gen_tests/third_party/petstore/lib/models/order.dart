import 'package:meta/meta.dart';
import 'package:petstore/model_helpers.dart';
import 'package:petstore/models/order_status.dart';

@immutable
class Order {
  const Order({
    this.id,
    this.petId,
    this.quantity,
    this.shipDate,
    this.status,
    this.complete,
  });

  /// Converts a `Map<String, dynamic>` to an [Order].
  factory Order.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Order',
      json,
      () => Order(
        id: json['id'] as int?,
        petId: json['petId'] as int?,
        quantity: json['quantity'] as int?,
        shipDate: maybeParseDateTime(json['shipDate'] as String?),
        status: OrderStatus.maybeFromJson(json['status'] as String?),
        complete: json['complete'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Order? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Order.fromJson(json);
  }

  /// Example: `10`
  final int? id;

  /// Example: `198772`
  final int? petId;

  /// Example: `7`
  final int? quantity;
  final DateTime? shipDate;

  /// Order Status
  /// Example: `'approved'`
  final OrderStatus? status;
  final bool? complete;

  /// Converts an [Order] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (petId != null) 'petId': petId,
      if (quantity != null) 'quantity': quantity,
      if (shipDate != null) 'shipDate': shipDate?.toIso8601String(),
      if (status != null) 'status': status?.toJson(),
      if (complete != null) 'complete': complete,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, petId, quantity, shipDate, status, complete]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Order &&
        id == other.id &&
        petId == other.petId &&
        quantity == other.quantity &&
        shipDate == other.shipDate &&
        status == other.status &&
        complete == other.complete;
  }
}
