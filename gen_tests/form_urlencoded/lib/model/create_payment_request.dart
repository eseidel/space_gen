import 'package:form_urlencoded/model/create_payment_request_address.dart';
import 'package:form_urlencoded/model/create_payment_request_line_items_inner.dart';
import 'package:form_urlencoded/model_helpers.dart';

class CreatePaymentRequest {
  CreatePaymentRequest({
    required this.idempotencyKey,
    this.parameters,
    this.address,
    this.lineItems = const [],
  });

  /// Converts a `Map<String, dynamic>` to a [CreatePaymentRequest].
  factory CreatePaymentRequest.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'CreatePaymentRequest',
      json,
      () => CreatePaymentRequest(
        idempotencyKey: json['idempotency_key'] as String,
        parameters: json['parameters'],
        address: CreatePaymentRequestAddress.maybeFromJson(
          json['address'] as Map<String, dynamic>?,
        ),
        lineItems:
            (json['line_items'] as List?)
                ?.map<CreatePaymentRequestLineItemsInner>(
                  (e) => CreatePaymentRequestLineItemsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            const [],
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreatePaymentRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreatePaymentRequest.fromJson(json);
  }

  String idempotencyKey;

  /// A single-level JSON object passed through as a form field.
  dynamic parameters;
  CreatePaymentRequestAddress? address;
  List<CreatePaymentRequestLineItemsInner> lineItems;

  /// Converts a [CreatePaymentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'idempotency_key': idempotencyKey,
      'parameters': ?parameters,
      'address': ?address?.toJson(),
      'line_items': lineItems.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    idempotencyKey,
    parameters,
    address,
    listHash(lineItems),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreatePaymentRequest &&
        idempotencyKey == other.idempotencyKey &&
        parameters == other.parameters &&
        address == other.address &&
        listsEqual(lineItems, other.lineItems);
  }
}
