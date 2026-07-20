import 'package:types/date.dart';
import 'package:types/model/email_type.dart';
import 'package:types/model/priority.dart';
import 'package:types/model/status.dart';
import 'package:types/model/stock_status.dart';
import 'package:types/model/timestamp.dart';
import 'package:types/model/uuid_type.dart';
import 'package:types/model/widget.dart';
import 'package:types/model_helpers.dart';

class Types200Response {
  Types200Response({
    required this.date,
    required this.inlineDate,
    required this.email,
    required this.uuid,
    required this.timestamp,
    required this.widget,
    required this.status,
    this.stock,
    this.priority,
  });

  /// Converts a `Map<String, dynamic>` to a [Types200Response].
  factory Types200Response.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'Types200Response',
      json,
      () => Types200Response(
        date: Date.fromJson(json['date'] as String),
        inlineDate: Date.fromJson(json['inlineDate'] as String),
        email: EmailType.fromJson(json['email'] as String),
        uuid: UuidType.fromJson(json['uuid'] as String),
        timestamp: Timestamp.fromJson(json['timestamp'] as String),
        widget: Widget.fromJson(json['widget'] as Map<String, dynamic>),
        status: Status.fromJson(json['status'] as String),
        stock: StockStatus.maybeFromJson(json['stock'] as String?),
        priority: Priority.maybeFromJson(json['priority'] as int?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Types200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Types200Response.fromJson(json);
  }

  Date date;
  Date inlineDate;
  EmailType email;
  UuidType uuid;
  Timestamp timestamp;

  /// Smoke-test object to exercise list/map fields through the generated
  /// round-trip test — catches hashCode-vs-== drift on collections.
  Widget widget;
  Status status;

  /// Values whose sanitized identifiers collide — `in stock` and `in-stock`
  /// both reduce to the same identifier. The generated enum must disambiguate
  /// rather than declare it twice.
  StockStatus? stock;

  /// An integer enum — a closed set of int values. Renders as a validated int
  /// newtype (not a Dart enum); the generated round-trip test also exercises
  /// the membership check throwing FormatException on an out-of-set value.
  Priority? priority;

  /// Converts a [Types200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'date': date.toJson(),
      'inlineDate': inlineDate.toJson(),
      'email': email.toJson(),
      'uuid': uuid.toJson(),
      'timestamp': timestamp.toJson(),
      'widget': widget.toJson(),
      'status': status.toJson(),
      'stock': ?stock?.toJson(),
      'priority': ?priority?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    date,
    inlineDate,
    email,
    uuid,
    timestamp,
    widget,
    status,
    stock,
    priority,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Types200Response &&
        date == other.date &&
        inlineDate == other.inlineDate &&
        email == other.email &&
        uuid == other.uuid &&
        timestamp == other.timestamp &&
        widget == other.widget &&
        status == other.status &&
        stock == other.stock &&
        priority == other.priority;
  }
}
