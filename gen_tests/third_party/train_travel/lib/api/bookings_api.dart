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
import 'package:train_travel/messages/create_booking201_response.dart';
import 'package:train_travel/messages/get_booking200_response.dart';
import 'package:train_travel/messages/get_bookings200_response.dart';
import 'package:train_travel/models/booking.dart';

/// Create and manage bookings for train trips, including passenger details
/// and optional extras.
class BookingsApi {
  BookingsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List existing bookings
  /// Returns a list of all trip bookings by the authenticated user.
  /// [page] example: `1`
  /// [limit] example: `10`
  Future<GetBookings200Response> getBookings({
    int? page = 1,
    int? limit = 10,
  }) async {
    page?.validate(min: 1);
    limit?.validate(min: 1, max: 100);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/bookings',
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetBookings200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a booking
  /// A booking is a temporary hold on a trip. It is not confirmed until the
  /// payment is processed.
  Future<CreateBooking201Response> createBooking(Booking booking) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/bookings',
      body: booking.toJson(),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CreateBooking201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a booking
  /// Returns the details of a specific booking.
  /// [bookingId] example: `'1725ff48-ab45-4bb5-9d02-88745177dedb'`
  Future<GetBooking200Response> getBooking(String bookingId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/bookings/{bookingId}'.replaceAll(
        '{bookingId}',
        Uri.encodeComponent(bookingId),
      ),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetBooking200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a booking
  /// Deletes a booking, cancelling the hold on the trip.
  /// [bookingId] example: `'1725ff48-ab45-4bb5-9d02-88745177dedb'`
  Future<void> deleteBooking(String bookingId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/bookings/{bookingId}'.replaceAll(
        '{bookingId}',
        Uri.encodeComponent(bookingId),
      ),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
