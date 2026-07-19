import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';

/// {@template station}
/// A train station.
/// {@endtemplate}
@immutable
class Station {
  /// {@macro station}
  const Station({
    required this.id,
    required this.name,
    required this.address,
    required this.countryCode,
    this.timezone,
  });

  /// Converts a `Map<String, dynamic>` to a [Station].
  factory Station.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Station',
      json,
      () => Station(
        id: json['id'] as String,
        name: json['name'] as String,
        address: json['address'] as String,
        countryCode: json['country_code'] as String,
        timezone: json['timezone'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Station? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Station.fromJson(json);
  }

  /// Unique identifier for the station.
  /// Example: `'efdbb9d1-02c2-4bc3-afb7-6788d8782b1e'`
  /// Example: `'b2e783e1-c824-4d63-b37a-d8d698862f1d'`
  final String id;

  /// The name of the station
  /// Example: `'Berlin Hauptbahnhof'`
  /// Example: `'Paris Gare du Nord'`
  final String name;

  /// The address of the station.
  /// Example: `'Invalidenstraße 10557 Berlin, Germany'`
  /// Example: `'18 Rue de Dunkerque 75010 Paris, France'`
  final String address;

  /// The country code of the station.
  /// Example: `'DE'`
  /// Example: `'FR'`
  final String countryCode;

  /// The timezone of the station in the [IANA Time Zone Database
  /// format](https://www.iana.org/time-zones).
  /// Example: `'Europe/Berlin'`
  /// Example: `'Europe/Paris'`
  final String? timezone;

  /// Converts a [Station] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'country_code': countryCode,
      'timezone': ?timezone,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, name, address, countryCode, timezone]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Station &&
        id == other.id &&
        name == other.name &&
        address == other.address &&
        countryCode == other.countryCode &&
        timezone == other.timezone;
  }
}
