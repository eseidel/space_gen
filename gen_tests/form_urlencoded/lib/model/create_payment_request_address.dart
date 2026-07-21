import 'package:form_urlencoded/model_helpers.dart';

class CreatePaymentRequestAddress {
  CreatePaymentRequestAddress({this.city, this.zip});

  /// Converts a `Map<String, dynamic>` to a [CreatePaymentRequestAddress].
  factory CreatePaymentRequestAddress.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'CreatePaymentRequestAddress',
      json,
      () => CreatePaymentRequestAddress(
        city: json['city'] as String?,
        zip: json['zip'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreatePaymentRequestAddress? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreatePaymentRequestAddress.fromJson(json);
  }

  String? city;
  String? zip;

  /// Converts a [CreatePaymentRequestAddress] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'city': ?city, 'zip': ?zip};
  }

  @override
  int get hashCode => Object.hashAll([city, zip]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreatePaymentRequestAddress &&
        city == other.city &&
        zip == other.zip;
  }
}
