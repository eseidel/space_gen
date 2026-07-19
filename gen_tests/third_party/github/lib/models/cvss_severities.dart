import 'package:github/model_helpers.dart';
import 'package:github/models/cvss_severities_cvss_v3.dart';
import 'package:github/models/cvss_severities_cvss_v4.dart';
import 'package:meta/meta.dart';

@immutable
class CvssSeverities {
  const CvssSeverities({this.cvssV3, this.cvssV4});

  /// Converts a `Map<String, dynamic>` to a [CvssSeverities].
  factory CvssSeverities.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CvssSeverities',
      json,
      () => CvssSeverities(
        cvssV3: CvssSeveritiesCvssV3.maybeFromJson(
          json['cvss_v3'] as Map<String, dynamic>?,
        ),
        cvssV4: CvssSeveritiesCvssV4.maybeFromJson(
          json['cvss_v4'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CvssSeverities? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CvssSeverities.fromJson(json);
  }

  final CvssSeveritiesCvssV3? cvssV3;
  final CvssSeveritiesCvssV4? cvssV4;

  /// Converts a [CvssSeverities] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'cvss_v3': cvssV3?.toJson(), 'cvss_v4': cvssV4?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([cvssV3, cvssV4]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CvssSeverities &&
        cvssV3 == other.cvssV3 &&
        cvssV4 == other.cvssV4;
  }
}
