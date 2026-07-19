import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateReleaseAssetRequest {
  const ReposUpdateReleaseAssetRequest({this.name, this.label, this.state});

  /// Converts a `Map<String, dynamic>` to a [ReposUpdateReleaseAssetRequest].
  factory ReposUpdateReleaseAssetRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposUpdateReleaseAssetRequest',
      json,
      () => ReposUpdateReleaseAssetRequest(
        name: json['name'] as String?,
        label: json['label'] as String?,
        state: json['state'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateReleaseAssetRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateReleaseAssetRequest.fromJson(json);
  }

  /// The file name of the asset.
  final String? name;

  /// An alternate short description of the asset. Used in place of the
  /// filename.
  final String? label;

  /// Example: `'"uploaded"'`
  final String? state;

  /// Converts a [ReposUpdateReleaseAssetRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'label': label, 'state': state};
  }

  @override
  int get hashCode => Object.hashAll([name, label, state]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateReleaseAssetRequest &&
        name == other.name &&
        label == other.label &&
        state == other.state;
  }
}
