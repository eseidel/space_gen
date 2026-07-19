// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:train_travel/api_client.dart';
import 'package:train_travel/api_exception.dart';
import 'package:train_travel/messages/create_booking_payment200_response.dart';
import 'package:train_travel/models/booking_payment.dart';

/// Pay for bookings using a card or bank account, and view payment
/// status and history.
///
/// > warn
/// > Bookings usually expire within 1 hour so you'll need to make your payment
/// > before the expiry date
class PaymentsApi {
  PaymentsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Pay for a Booking
  /// A payment is an attempt to pay for the booking, which will confirm the
  /// booking for the user and enable them to get their tickets.
  /// [bookingId] example: `'1725ff48-ab45-4bb5-9d02-88745177dedb'`
  Future<CreateBookingPayment200Response> createBookingPayment(
    String bookingId,
    BookingPayment bookingPayment,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/bookings/{bookingId}/payment'.replaceAll(
        '{bookingId}',
        Uri.encodeComponent(bookingId),
      ),
      body: bookingPayment.toJson(),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CreateBookingPayment200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
