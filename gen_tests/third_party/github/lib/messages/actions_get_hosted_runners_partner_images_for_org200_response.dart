import 'package:github/model_helpers.dart';
import 'package:github/models/actions_hosted_runner_image.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsGetHostedRunnersPartnerImagesForOrg200Response {
  const ActionsGetHostedRunnersPartnerImagesForOrg200Response({
    required this.totalCount,
    required this.images,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsGetHostedRunnersPartnerImagesForOrg200Response].
  factory ActionsGetHostedRunnersPartnerImagesForOrg200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsGetHostedRunnersPartnerImagesForOrg200Response',
      json,
      () => ActionsGetHostedRunnersPartnerImagesForOrg200Response(
        totalCount: json['total_count'] as int,
        images: (json['images'] as List)
            .map<ActionsHostedRunnerImage>(
              (e) =>
                  ActionsHostedRunnerImage.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsGetHostedRunnersPartnerImagesForOrg200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsGetHostedRunnersPartnerImagesForOrg200Response.fromJson(json);
  }

  final int totalCount;
  final List<ActionsHostedRunnerImage> images;

  /// Converts an [ActionsGetHostedRunnersPartnerImagesForOrg200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'images': images.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(images)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsGetHostedRunnersPartnerImagesForOrg200Response &&
        totalCount == other.totalCount &&
        listsEqual(images, other.images);
  }
}
