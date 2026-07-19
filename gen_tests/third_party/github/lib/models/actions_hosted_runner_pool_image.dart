import 'package:github/model_helpers.dart';
import 'package:github/models/actions_hosted_runner_pool_image_source.dart';
import 'package:meta/meta.dart';

/// {@template actions_hosted_runner_pool_image}
/// GitHub-hosted runner image details.
/// Provides details of a hosted runner image
/// {@endtemplate}
@immutable
class ActionsHostedRunnerPoolImage {
  /// {@macro actions_hosted_runner_pool_image}
  const ActionsHostedRunnerPoolImage({
    required this.id,
    required this.sizeGb,
    required this.displayName,
    required this.source,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsHostedRunnerPoolImage].
  factory ActionsHostedRunnerPoolImage.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsHostedRunnerPoolImage',
      json,
      () => ActionsHostedRunnerPoolImage(
        id: json['id'] as String,
        sizeGb: json['size_gb'] as int,
        displayName: json['display_name'] as String,
        source: ActionsHostedRunnerPoolImageSource.fromJson(
          json['source'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsHostedRunnerPoolImage? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsHostedRunnerPoolImage.fromJson(json);
  }

  /// The ID of the image. Use this ID for the `image` parameter when creating
  /// a new larger runner.
  /// Example: `'ubuntu-20.04'`
  final String id;

  /// Image size in GB.
  /// Example: `86`
  final int sizeGb;

  /// Display name for this image.
  /// Example: `20.04`
  final String displayName;

  /// The image provider.
  final ActionsHostedRunnerPoolImageSource source;

  /// Converts an [ActionsHostedRunnerPoolImage] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'size_gb': sizeGb,
      'display_name': displayName,
      'source': source.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, sizeGb, displayName, source]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsHostedRunnerPoolImage &&
        id == other.id &&
        sizeGb == other.sizeGb &&
        displayName == other.displayName &&
        source == other.source;
  }
}
