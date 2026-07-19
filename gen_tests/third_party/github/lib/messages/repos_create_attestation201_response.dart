import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateAttestation201Response {
  const ReposCreateAttestation201Response({this.id});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreateAttestation201Response].
  factory ReposCreateAttestation201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreateAttestation201Response',
      json,
      () => ReposCreateAttestation201Response(id: json['id'] as int?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateAttestation201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateAttestation201Response.fromJson(json);
  }

  /// The ID of the attestation.
  final int? id;

  /// Converts a [ReposCreateAttestation201Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateAttestation201Response && id == other.id;
  }
}
