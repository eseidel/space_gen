// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:form_urlencoded/model_helpers.dart';

class CreatePaymentRequestLineItemsInner {
  CreatePaymentRequestLineItemsInner({this.sku});

  /// Converts a `Map<String, dynamic>` to a
  /// [CreatePaymentRequestLineItemsInner].
  factory CreatePaymentRequestLineItemsInner.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'CreatePaymentRequestLineItemsInner',
      json,
      () => CreatePaymentRequestLineItemsInner(sku: json['sku'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreatePaymentRequestLineItemsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreatePaymentRequestLineItemsInner.fromJson(json);
  }

  String? sku;

  /// Converts a [CreatePaymentRequestLineItemsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sku': ?sku};
  }

  @override
  int get hashCode => sku.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreatePaymentRequestLineItemsInner && sku == other.sku;
  }
}
