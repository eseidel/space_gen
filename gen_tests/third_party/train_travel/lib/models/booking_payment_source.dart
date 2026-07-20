// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';
import 'package:train_travel/api_exception.dart';
import 'package:train_travel/model_helpers.dart';
import 'package:train_travel/models/booking_payment_source_one_of_1_account_type.dart';

/// The payment source to take the payment from. This can be a card or a bank
/// account. Some of these properties will be hidden on read to protect PII
/// leaking.
sealed class BookingPaymentSource {
  const BookingPaymentSource();

  factory BookingPaymentSource.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('address_country')) {
      return Card.fromJson(json);
    }
    if (json.containsKey('account_type')) {
      return BankAccount.fromJson(json);
    }
    throw FormatException(
      'No variant of BookingPaymentSource matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BookingPaymentSource? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BookingPaymentSource.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

/// {@template booking_payment_source_one_of_0}
/// Card
/// A card (debit or credit) to take payment from.
/// {@endtemplate}
@immutable
final class Card extends BookingPaymentSource {
  /// {@macro booking_payment_source_one_of_0}
  Card({
    required this.name,
    required this.number,
    required this.cvc,
    required this.expMonth,
    required this.expYear,
    required this.addressCountry,
    this.addressLine1,
    this.addressLine2,
    this.addressCity,
    this.addressPostCode,
  }) {
    cvc.validate(minLength: 3, maxLength: 4);
  }

  /// Converts a `Map<String, dynamic>` to a [Card].
  factory Card.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Card',
      json,
      () => Card(
        name: json['name'] as String,
        number: json['number'] as String,
        cvc: json['cvc'] as String,
        expMonth: json['exp_month'] as int,
        expYear: json['exp_year'] as int,
        addressLine1: json['address_line1'] as String?,
        addressLine2: json['address_line2'] as String?,
        addressCity: json['address_city'] as String?,
        addressCountry: json['address_country'] as String,
        addressPostCode: json['address_post_code'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Card? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Card.fromJson(json);
  }

  String get object => 'card';

  /// Cardholder's full name as it appears on the card.
  /// Example: `'Francis Bourgeois'`
  final String name;

  /// The card number, as a string without any separators. On read all but the
  /// last four digits will be masked for security.
  /// Example: `'4242424242424242'`
  final String number;

  /// Card security code, 3 or 4 digits usually found on the back of the card.
  /// Example: `'123'`
  final String cvc;

  /// Two-digit number representing the card's expiration month.
  /// Example: `12`
  final int expMonth;

  /// Four-digit number representing the card's expiration year.
  /// Example: `2025`
  final int expYear;
  final String? addressLine1;
  final String? addressLine2;
  final String? addressCity;
  final String addressCountry;
  final String? addressPostCode;

  /// Converts a [Card] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'name': name,
      'number': number,
      'cvc': cvc,
      'exp_month': expMonth,
      'exp_year': expYear,
      'address_line1': ?addressLine1,
      'address_line2': ?addressLine2,
      'address_city': ?addressCity,
      'address_country': addressCountry,
      'address_post_code': ?addressPostCode,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    number,
    cvc,
    expMonth,
    expYear,
    addressLine1,
    addressLine2,
    addressCity,
    addressCountry,
    addressPostCode,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Card &&
        name == other.name &&
        number == other.number &&
        cvc == other.cvc &&
        expMonth == other.expMonth &&
        expYear == other.expYear &&
        addressLine1 == other.addressLine1 &&
        addressLine2 == other.addressLine2 &&
        addressCity == other.addressCity &&
        addressCountry == other.addressCountry &&
        addressPostCode == other.addressPostCode;
  }
}

/// {@template booking_payment_source_one_of_1}
/// Bank Account
/// A bank account to take payment from. Must be able to make payments in the
/// currency specified in the payment.
/// {@endtemplate}
@immutable
final class BankAccount extends BookingPaymentSource {
  /// {@macro booking_payment_source_one_of_1}
  const BankAccount({
    required this.name,
    required this.number,
    required this.accountType,
    required this.bankName,
    required this.country,
    this.sortCode,
  });

  /// Converts a `Map<String, dynamic>` to a [BankAccount].
  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BankAccount',
      json,
      () => BankAccount(
        name: json['name'] as String,
        number: json['number'] as String,
        sortCode: json['sort_code'] as String?,
        accountType: BookingPaymentSourceOneOf1AccountType.fromJson(
          json['account_type'] as String,
        ),
        bankName: json['bank_name'] as String,
        country: json['country'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BankAccount? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BankAccount.fromJson(json);
  }

  String get object => 'bank_account';
  final String name;

  /// The account number for the bank account, in string form. Must be a
  /// current account.
  final String number;

  /// The sort code for the bank account, in string form. Must be a six-digit
  /// number.
  final String? sortCode;

  /// The type of entity that holds the account. This can be either
  /// `individual` or `company`.
  final BookingPaymentSourceOneOf1AccountType accountType;

  /// The name of the bank associated with the routing number.
  /// Example: `'Starling Bank'`
  final String bankName;

  /// Two-letter country code (ISO 3166-1 alpha-2).
  final String country;

  /// Converts a [BankAccount] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'object': object,
      'name': name,
      'number': number,
      'sort_code': ?sortCode,
      'account_type': accountType.toJson(),
      'bank_name': bankName,
      'country': country,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, number, sortCode, accountType, bankName, country]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BankAccount &&
        name == other.name &&
        number == other.number &&
        sortCode == other.sortCode &&
        accountType == other.accountType &&
        bankName == other.bankName &&
        country == other.country;
  }
}
