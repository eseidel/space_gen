import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryAdvisoryCwesInner {
  const RepositoryAdvisoryCwesInner({required this.cweId, required this.name});

  /// Converts a `Map<String, dynamic>` to a [RepositoryAdvisoryCwesInner].
  factory RepositoryAdvisoryCwesInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryAdvisoryCwesInner',
      json,
      () => RepositoryAdvisoryCwesInner(
        cweId: json['cwe_id'] as String,
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryAdvisoryCwesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryAdvisoryCwesInner.fromJson(json);
  }

  /// The Common Weakness Enumeration (CWE) identifier.
  final String cweId;

  /// The name of the CWE.
  final String name;

  /// Converts a [RepositoryAdvisoryCwesInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'cwe_id': cweId, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([cweId, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryAdvisoryCwesInner &&
        cweId == other.cweId &&
        name == other.name;
  }
}
