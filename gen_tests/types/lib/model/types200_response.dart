// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:types/model/date_type.dart';
import 'package:types/model/email_type.dart';
import 'package:types/model/status.dart';
import 'package:types/model/timestamp.dart';
import 'package:types/model/uuid_type.dart';
import 'package:types/model/widget.dart';
import 'package:types/model_helpers.dart';

class Types200Response {
  Types200Response({
    required this.date,
    required this.email,
    required this.uuid,
    required this.timestamp,
    required this.widget,
    required this.status,
  });

  /// Converts a `Map<String, dynamic>` to a [Types200Response].
  factory Types200Response.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'Types200Response',
      json,
      () => Types200Response(
        date: DateType.fromJson(json['date'] as String),
        email: EmailType.fromJson(json['email'] as String),
        uuid: UuidType.fromJson(json['uuid'] as String),
        timestamp: Timestamp.fromJson(json['timestamp'] as String),
        widget: Widget.fromJson(json['widget'] as Map<String, dynamic>),
        status: Status.fromJson(json['status'] as String),
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

  DateType date;
  EmailType email;
  UuidType uuid;
  Timestamp timestamp;

  /// Smoke-test object to exercise list/map fields through the generated
  /// round-trip test — catches hashCode-vs-== drift on collections.
  Widget widget;
  Status status;

  /// Converts a [Types200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'date': date.toJson(),
      'email': email.toJson(),
      'uuid': uuid.toJson(),
      'timestamp': timestamp.toJson(),
      'widget': widget.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    date,
    email,
    uuid,
    timestamp,
    widget,
    status,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Types200Response &&
        date == other.date &&
        email == other.email &&
        uuid == other.uuid &&
        timestamp == other.timestamp &&
        widget == other.widget &&
        status == other.status;
  }
}
