import 'package:types/model/date_type.dart';
import 'package:types/model/email_type.dart';

class Types200Response {
  Types200Response({required this.date, required this.email});

  factory Types200Response.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return Types200Response(
      date: DateType.fromJson(json['date'] as String),
      email: EmailType.fromJson(json['email'] as String),
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

  Map<String, dynamic> toJson() {
    return {'date': date.toJson(), 'email': email.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([date, email]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Types200Response &&
        date == other.date &&
        email == other.email;
  }
}
