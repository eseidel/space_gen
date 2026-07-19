import 'package:github/model_helpers.dart';
import 'package:github/models/migrations_set_lfs_preference_request_use_lfs.dart';
import 'package:meta/meta.dart';

@immutable
class MigrationsSetLfsPreferenceRequest {
  const MigrationsSetLfsPreferenceRequest({required this.useLfs});

  /// Converts a `Map<String, dynamic>` to a
  /// [MigrationsSetLfsPreferenceRequest].
  factory MigrationsSetLfsPreferenceRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MigrationsSetLfsPreferenceRequest',
      json,
      () => MigrationsSetLfsPreferenceRequest(
        useLfs: MigrationsSetLfsPreferenceRequestUseLfs.fromJson(
          json['use_lfs'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MigrationsSetLfsPreferenceRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MigrationsSetLfsPreferenceRequest.fromJson(json);
  }

  /// Whether to store large files during the import. `opt_in` means large
  /// files will be stored using Git LFS. `opt_out` means large files will be
  /// removed during the import.
  final MigrationsSetLfsPreferenceRequestUseLfs useLfs;

  /// Converts a [MigrationsSetLfsPreferenceRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'use_lfs': useLfs.toJson()};
  }

  @override
  int get hashCode => useLfs.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MigrationsSetLfsPreferenceRequest && useLfs == other.useLfs;
  }
}
