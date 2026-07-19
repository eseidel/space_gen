import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class DependencyGraphCreateRepositorySnapshot201Response {
  const DependencyGraphCreateRepositorySnapshot201Response({
    required this.id,
    required this.createdAt,
    required this.result,
    required this.message,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependencyGraphCreateRepositorySnapshot201Response].
  factory DependencyGraphCreateRepositorySnapshot201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependencyGraphCreateRepositorySnapshot201Response',
      json,
      () => DependencyGraphCreateRepositorySnapshot201Response(
        id: json['id'] as int,
        createdAt: json['created_at'] as String,
        result: json['result'] as String,
        message: json['message'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependencyGraphCreateRepositorySnapshot201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependencyGraphCreateRepositorySnapshot201Response.fromJson(json);
  }

  /// ID of the created snapshot.
  final int id;

  /// The time at which the snapshot was created.
  final String createdAt;

  /// Either "SUCCESS", "ACCEPTED", or "INVALID". "SUCCESS" indicates that the
  /// snapshot was successfully created and the repository's dependencies were
  /// updated. "ACCEPTED" indicates that the snapshot was successfully
  /// created, but the repository's dependencies were not updated. "INVALID"
  /// indicates that the snapshot was malformed.
  final String result;

  /// A message providing further details about the result, such as why the
  /// dependencies were not updated.
  final String message;

  /// Converts a [DependencyGraphCreateRepositorySnapshot201Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'result': result,
      'message': message,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, createdAt, result, message]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependencyGraphCreateRepositorySnapshot201Response &&
        id == other.id &&
        createdAt == other.createdAt &&
        result == other.result &&
        message == other.message;
  }
}
