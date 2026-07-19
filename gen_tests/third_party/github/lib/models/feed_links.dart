import 'package:github/model_helpers.dart';
import 'package:github/models/link_with_type.dart';
import 'package:meta/meta.dart';

@immutable
class FeedLinks {
  const FeedLinks({
    required this.timeline,
    required this.user,
    this.securityAdvisories,
    this.currentUser,
    this.currentUserPublic,
    this.currentUserActor,
    this.currentUserOrganization,
    this.currentUserOrganizations,
    this.repositoryDiscussions,
    this.repositoryDiscussionsCategory,
  });

  /// Converts a `Map<String, dynamic>` to a [FeedLinks].
  factory FeedLinks.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FeedLinks',
      json,
      () => FeedLinks(
        timeline: LinkWithType.fromJson(
          json['timeline'] as Map<String, dynamic>,
        ),
        user: LinkWithType.fromJson(json['user'] as Map<String, dynamic>),
        securityAdvisories: LinkWithType.maybeFromJson(
          json['security_advisories'] as Map<String, dynamic>?,
        ),
        currentUser: LinkWithType.maybeFromJson(
          json['current_user'] as Map<String, dynamic>?,
        ),
        currentUserPublic: LinkWithType.maybeFromJson(
          json['current_user_public'] as Map<String, dynamic>?,
        ),
        currentUserActor: LinkWithType.maybeFromJson(
          json['current_user_actor'] as Map<String, dynamic>?,
        ),
        currentUserOrganization: LinkWithType.maybeFromJson(
          json['current_user_organization'] as Map<String, dynamic>?,
        ),
        currentUserOrganizations: (json['current_user_organizations'] as List?)
            ?.map<LinkWithType>(
              (e) => LinkWithType.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        repositoryDiscussions: LinkWithType.maybeFromJson(
          json['repository_discussions'] as Map<String, dynamic>?,
        ),
        repositoryDiscussionsCategory: LinkWithType.maybeFromJson(
          json['repository_discussions_category'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FeedLinks? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FeedLinks.fromJson(json);
  }

  /// Link With Type
  /// Hypermedia Link with Type
  final LinkWithType timeline;

  /// Link With Type
  /// Hypermedia Link with Type
  final LinkWithType user;

  /// Link With Type
  /// Hypermedia Link with Type
  final LinkWithType? securityAdvisories;

  /// Link With Type
  /// Hypermedia Link with Type
  final LinkWithType? currentUser;

  /// Link With Type
  /// Hypermedia Link with Type
  final LinkWithType? currentUserPublic;

  /// Link With Type
  /// Hypermedia Link with Type
  final LinkWithType? currentUserActor;

  /// Link With Type
  /// Hypermedia Link with Type
  final LinkWithType? currentUserOrganization;
  final List<LinkWithType>? currentUserOrganizations;

  /// Link With Type
  /// Hypermedia Link with Type
  final LinkWithType? repositoryDiscussions;

  /// Link With Type
  /// Hypermedia Link with Type
  final LinkWithType? repositoryDiscussionsCategory;

  /// Converts a [FeedLinks] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'timeline': timeline.toJson(),
      'user': user.toJson(),
      if (securityAdvisories != null)
        'security_advisories': securityAdvisories?.toJson(),
      if (currentUser != null) 'current_user': currentUser?.toJson(),
      if (currentUserPublic != null)
        'current_user_public': currentUserPublic?.toJson(),
      if (currentUserActor != null)
        'current_user_actor': currentUserActor?.toJson(),
      if (currentUserOrganization != null)
        'current_user_organization': currentUserOrganization?.toJson(),
      if (currentUserOrganizations != null)
        'current_user_organizations': currentUserOrganizations
            ?.map((e) => e.toJson())
            .toList(),
      if (repositoryDiscussions != null)
        'repository_discussions': repositoryDiscussions?.toJson(),
      if (repositoryDiscussionsCategory != null)
        'repository_discussions_category': repositoryDiscussionsCategory
            ?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    timeline,
    user,
    securityAdvisories,
    currentUser,
    currentUserPublic,
    currentUserActor,
    currentUserOrganization,
    listHash(currentUserOrganizations),
    repositoryDiscussions,
    repositoryDiscussionsCategory,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FeedLinks &&
        timeline == other.timeline &&
        user == other.user &&
        securityAdvisories == other.securityAdvisories &&
        currentUser == other.currentUser &&
        currentUserPublic == other.currentUserPublic &&
        currentUserActor == other.currentUserActor &&
        currentUserOrganization == other.currentUserOrganization &&
        listsEqual(currentUserOrganizations, other.currentUserOrganizations) &&
        repositoryDiscussions == other.repositoryDiscussions &&
        repositoryDiscussionsCategory == other.repositoryDiscussionsCategory;
  }
}
