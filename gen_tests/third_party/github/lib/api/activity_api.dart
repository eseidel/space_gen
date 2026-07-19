// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/activity_list_repos_starred_by_user200_response.dart';
import 'package:github/messages/activity_list_stargazers_for_repo200_response.dart';
import 'package:github/messages/activity_mark_notifications_as_read202_response.dart';
import 'package:github/messages/activity_mark_notifications_as_read_request.dart';
import 'package:github/messages/activity_mark_repo_notifications_as_read202_response.dart';
import 'package:github/messages/activity_mark_repo_notifications_as_read_request.dart';
import 'package:github/messages/activity_set_repo_subscription_request.dart';
import 'package:github/messages/activity_set_thread_subscription_request.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/event.dart';
import 'package:github/models/feed.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/repository.dart';
import 'package:github/models/repository_subscription.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/sort_starred_param.dart';
import 'package:github/models/thread.dart';
import 'package:github/models/thread_subscription.dart';
import 'package:meta/meta.dart';

sealed class ActivityMarkNotificationsAsReadResponse {
  const ActivityMarkNotificationsAsReadResponse();
}

@immutable
final class ActivityMarkNotificationsAsReadResponse202
    extends ActivityMarkNotificationsAsReadResponse {
  const ActivityMarkNotificationsAsReadResponse202(this.value);

  final ActivityMarkNotificationsAsRead202Response value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityMarkNotificationsAsReadResponse202 &&
        value == other.value;
  }
}

@immutable
final class ActivityMarkNotificationsAsReadResponse205
    extends ActivityMarkNotificationsAsReadResponse {
  const ActivityMarkNotificationsAsReadResponse205();

  @override
  int get hashCode => 205;

  @override
  bool operator ==(Object other) =>
      other is ActivityMarkNotificationsAsReadResponse205;
}

sealed class ActivityMarkRepoNotificationsAsReadResponse {
  const ActivityMarkRepoNotificationsAsReadResponse();
}

@immutable
final class ActivityMarkRepoNotificationsAsReadResponse202
    extends ActivityMarkRepoNotificationsAsReadResponse {
  const ActivityMarkRepoNotificationsAsReadResponse202(this.value);

  final ActivityMarkRepoNotificationsAsRead202Response value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityMarkRepoNotificationsAsReadResponse202 &&
        value == other.value;
  }
}

@immutable
final class ActivityMarkRepoNotificationsAsReadResponse205
    extends ActivityMarkRepoNotificationsAsReadResponse {
  const ActivityMarkRepoNotificationsAsReadResponse205();

  @override
  int get hashCode => 205;

  @override
  bool operator ==(Object other) =>
      other is ActivityMarkRepoNotificationsAsReadResponse205;
}

/// Activity APIs provide access to notifications, subscriptions, and timelines.
class ActivityApi {
  ActivityApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List public events
  /// > [!NOTE]
  /// > This API is not built to serve real-time use cases. Depending on the
  /// time of day, event latency can be anywhere from 30s to 6h.
  Future<List<Event>> listPublicEvents({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/events',
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Event>((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get feeds
  /// Lists the feeds available to the authenticated user. The response
  /// provides a URL for each feed. You can then get a specific feed by
  /// sending a request to one of the feed URLs.
  ///
  /// *   **Timeline**: The GitHub global public timeline
  /// *   **User**: The public timeline for any user, using `uri_template`.
  /// For more information, see
  /// "[Hypermedia](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#hypermedia)."
  /// *   **Current user public**: The public timeline for the authenticated
  /// user
  /// *   **Current user**: The private timeline for the authenticated user
  /// *   **Current user actor**: The private timeline for activity created by
  /// the authenticated user
  /// *   **Current user organizations**: The private timeline for the
  /// organizations the authenticated user is a member of.
  /// *   **Security advisories**: A collection of public announcements that
  /// provide information about security-related vulnerabilities in software
  /// on GitHub.
  ///
  /// By default, timeline resources are returned in JSON. You can specify the
  /// `application/atom+xml` type in the `Accept` header to return timeline
  /// resources in Atom format. For more information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// > [!NOTE]
  /// > Private feeds are only returned when [authenticating via Basic
  /// Auth](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication)
  /// since current feed URIs use the older, non revocable auth tokens.
  Future<Feed> getFeeds() async {
    final response = await client.invokeApi(method: Method.get, path: '/feeds');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Feed.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List public events for a network of repositories
  /// > [!NOTE]
  /// > This API is not built to serve real-time use cases. Depending on the
  /// time of day, event latency can be anywhere from 30s to 6h.
  Future<List<Event>> listPublicEventsForRepoNetwork(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/networks/{owner}/{repo}/events'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Event>((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List notifications for the authenticated user
  /// List all notifications for the current user, sorted by most recently
  /// updated.
  Future<List<Thread>> listNotificationsForAuthenticatedUser({
    bool? all = false,
    bool? participating = false,
    DateTime? since,
    DateTime? before,
    int? page = 1,
    int? perPage = 50,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/notifications',
      queryParameters: {
        if (all != null) 'all': [all.toString()],
        if (participating != null) 'participating': [participating.toString()],
        if (since != null) 'since': [since.toIso8601String()],
        if (before != null) 'before': [before.toIso8601String()],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Thread>((e) => Thread.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Mark notifications as read
  /// Marks all notifications as "read" for the current user. If the number of
  /// notifications is too large to complete in one request, you will receive
  /// a `202 Accepted` status and GitHub will run an asynchronous process to
  /// mark notifications as "read." To check whether any "unread"
  /// notifications remain, you can use the [List notifications for the
  /// authenticated
  /// user](https://docs.github.com/rest/activity/notifications#list-notifications-for-the-authenticated-user)
  /// endpoint and pass the query parameter `all=false`.
  Future<ActivityMarkNotificationsAsReadResponse> markNotificationsAsRead({
    ActivityMarkNotificationsAsReadRequest?
    activityMarkNotificationsAsReadRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/notifications',
      body: activityMarkNotificationsAsReadRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      202 => ActivityMarkNotificationsAsReadResponse202(
        ActivityMarkNotificationsAsRead202Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      205 => const ActivityMarkNotificationsAsReadResponse205(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Get a thread
  /// Gets information about a notification thread.
  Future<Thread> getThread(int threadId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/notifications/threads/{thread_id}'.replaceAll(
        '{thread_id}',
        '$threadId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Thread.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Mark a thread as done
  /// Marks a thread as "done." Marking a thread as "done" is equivalent to
  /// marking a notification in your notification inbox on GitHub as done:
  /// https://github.com/notifications.
  Future<void> markThreadAsDone(int threadId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/notifications/threads/{thread_id}'.replaceAll(
        '{thread_id}',
        '$threadId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Mark a thread as read
  /// Marks a thread as "read." Marking a thread as "read" is equivalent to
  /// clicking a notification in your notification inbox on GitHub:
  /// https://github.com/notifications.
  Future<void> markThreadAsRead(int threadId) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/notifications/threads/{thread_id}'.replaceAll(
        '{thread_id}',
        '$threadId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a thread subscription for the authenticated user
  /// This checks to see if the current user is subscribed to a thread. You
  /// can also [get a repository
  /// subscription](https://docs.github.com/rest/activity/watching#get-a-repository-subscription).
  ///
  /// Note that subscriptions are only generated if a user is participating in
  /// a conversation--for example, they've replied to the thread, were
  /// **@mentioned**, or manually subscribe to a thread.
  Future<ThreadSubscription> getThreadSubscriptionForAuthenticatedUser(
    int threadId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/notifications/threads/{thread_id}/subscription'.replaceAll(
        '{thread_id}',
        '$threadId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ThreadSubscription.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set a thread subscription
  /// If you are watching a repository, you receive notifications for all
  /// threads by default. Use this endpoint to ignore future notifications for
  /// threads until you comment on the thread or get an **@mention**.
  ///
  /// You can also use this endpoint to subscribe to threads that you are
  /// currently not receiving notifications for or to subscribed to threads
  /// that you have previously ignored.
  ///
  /// Unsubscribing from a conversation in a repository that you are not
  /// watching is functionally equivalent to the [Delete a thread
  /// subscription](https://docs.github.com/rest/activity/notifications#delete-a-thread-subscription)
  /// endpoint.
  Future<ThreadSubscription> setThreadSubscription(
    int threadId, {
    ActivitySetThreadSubscriptionRequest? activitySetThreadSubscriptionRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/notifications/threads/{thread_id}/subscription'.replaceAll(
        '{thread_id}',
        '$threadId',
      ),
      body: activitySetThreadSubscriptionRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ThreadSubscription.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a thread subscription
  /// Mutes all future notifications for a conversation until you comment on
  /// the thread or get an **@mention**. If you are watching the repository of
  /// the thread, you will still receive notifications. To ignore future
  /// notifications for a repository you are watching, use the [Set a thread
  /// subscription](https://docs.github.com/rest/activity/notifications#set-a-thread-subscription)
  /// endpoint and set `ignore` to `true`.
  Future<void> deleteThreadSubscription(int threadId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/notifications/threads/{thread_id}/subscription'.replaceAll(
        '{thread_id}',
        '$threadId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List public organization events
  /// > [!NOTE]
  /// > This API is not built to serve real-time use cases. Depending on the
  /// time of day, event latency can be anywhere from 30s to 6h.
  Future<List<Event>> listPublicOrgEvents(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/events'.replaceAll('{org}', Uri.encodeComponent(org)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Event>((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository events
  /// > [!NOTE]
  /// > This API is not built to serve real-time use cases. Depending on the
  /// time of day, event latency can be anywhere from 30s to 6h.
  Future<List<Event>> listRepoEvents(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/events'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Event>((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository notifications for the authenticated user
  /// Lists all notifications for the current user in the specified
  /// repository.
  Future<List<Thread>> listRepoNotificationsForAuthenticatedUser(
    String owner,
    String repo, {
    bool? all = false,
    bool? participating = false,
    DateTime? since,
    DateTime? before,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/notifications'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (all != null) 'all': [all.toString()],
        if (participating != null) 'participating': [participating.toString()],
        if (since != null) 'since': [since.toIso8601String()],
        if (before != null) 'before': [before.toIso8601String()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Thread>((e) => Thread.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Mark repository notifications as read
  /// Marks all notifications in a repository as "read" for the current user.
  /// If the number of notifications is too large to complete in one request,
  /// you will receive a `202 Accepted` status and GitHub will run an
  /// asynchronous process to mark notifications as "read." To check whether
  /// any "unread" notifications remain, you can use the [List repository
  /// notifications for the authenticated
  /// user](https://docs.github.com/rest/activity/notifications#list-repository-notifications-for-the-authenticated-user)
  /// endpoint and pass the query parameter `all=false`.
  Future<ActivityMarkRepoNotificationsAsReadResponse>
  markRepoNotificationsAsRead(
    String owner,
    String repo, {
    ActivityMarkRepoNotificationsAsReadRequest?
    activityMarkRepoNotificationsAsReadRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/notifications'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: activityMarkRepoNotificationsAsReadRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      202 => ActivityMarkRepoNotificationsAsReadResponse202(
        ActivityMarkRepoNotificationsAsRead202Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      205 => const ActivityMarkRepoNotificationsAsReadResponse205(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// List stargazers
  /// Lists the people that have starred the repository.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.star+json`**: Includes a timestamp of when
  /// the star was created.
  Future<ActivityListStargazersForRepo200Response> listStargazersForRepo(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/stargazers'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActivityListStargazersForRepo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List watchers
  /// Lists the people watching the specified repository.
  Future<List<SimpleUser>> listWatchersForRepo(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/subscribers'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository subscription
  /// Gets information about whether the authenticated user is subscribed to
  /// the repository.
  Future<RepositorySubscription> getRepoSubscription(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/subscription'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositorySubscription.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set a repository subscription
  /// If you would like to watch a repository, set `subscribed` to `true`. If
  /// you would like to ignore notifications made within a repository, set
  /// `ignored` to `true`. If you would like to stop watching a repository,
  /// [delete the repository's
  /// subscription](https://docs.github.com/rest/activity/watching#delete-a-repository-subscription)
  /// completely.
  Future<RepositorySubscription> setRepoSubscription(
    String owner,
    String repo, {
    ActivitySetRepoSubscriptionRequest? activitySetRepoSubscriptionRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/subscription'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: activitySetRepoSubscriptionRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositorySubscription.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a repository subscription
  /// This endpoint should only be used to stop watching a repository. To
  /// control whether or not you wish to receive notifications from a
  /// repository, [set the repository's subscription
  /// manually](https://docs.github.com/rest/activity/watching#set-a-repository-subscription).
  Future<void> deleteRepoSubscription(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/subscription'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repositories starred by the authenticated user
  /// Lists repositories the authenticated user has starred.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.star+json`**: Includes a timestamp of when
  /// the star was created.
  Future<List<Repository>> listReposStarredByAuthenticatedUser({
    SortStarredParam? sort = SortStarredParam.created,
    DirectionParam? direction = DirectionParam.desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/starred',
      queryParameters: {
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Repository>(
            (e) => Repository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if a repository is starred by the authenticated user
  /// Whether the authenticated user has starred the repository.
  Future<void> checkRepoIsStarredByAuthenticatedUser(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/starred/{owner}/{repo}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Star a repository for the authenticated user
  /// Note that you'll need to set `Content-Length` to zero when calling out
  /// to this endpoint. For more information, see "[HTTP
  /// method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  Future<void> starRepoForAuthenticatedUser(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/user/starred/{owner}/{repo}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Unstar a repository for the authenticated user
  /// Unstar a repository that the authenticated user has previously starred.
  Future<void> unstarRepoForAuthenticatedUser(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/starred/{owner}/{repo}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repositories watched by the authenticated user
  /// Lists repositories the authenticated user is watching.
  Future<List<MinimalRepository>> listWatchedReposForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/subscriptions',
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List events for the authenticated user
  /// If you are authenticated as the given user, you will see your private
  /// events. Otherwise, you'll only see public events. _Optional_: use the
  /// fine-grained token with following permission set to view private events:
  /// "Events" user permissions (read).
  ///
  /// > [!NOTE]
  /// > This API is not built to serve real-time use cases. Depending on the
  /// time of day, event latency can be anywhere from 30s to 6h.
  Future<List<Event>> listEventsForAuthenticatedUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/events'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Event>((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List organization events for the authenticated user
  /// This is the user's organization dashboard. You must be authenticated as
  /// the user to view this.
  ///
  /// > [!NOTE]
  /// > This API is not built to serve real-time use cases. Depending on the
  /// time of day, event latency can be anywhere from 30s to 6h.
  Future<List<Event>> listOrgEventsForAuthenticatedUser(
    String username,
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/events/orgs/{org}'
          .replaceAll('{username}', Uri.encodeComponent(username))
          .replaceAll('{org}', Uri.encodeComponent(org)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Event>((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List public events for a user
  /// > [!NOTE]
  /// > This API is not built to serve real-time use cases. Depending on the
  /// time of day, event latency can be anywhere from 30s to 6h.
  Future<List<Event>> listPublicEventsForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/events/public'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Event>((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List events received by the authenticated user
  /// These are events that you've received by watching repositories and
  /// following users. If you are authenticated as the
  /// given user, you will see private events. Otherwise, you'll only see
  /// public events.
  ///
  /// > [!NOTE]
  /// > This API is not built to serve real-time use cases. Depending on the
  /// time of day, event latency can be anywhere from 30s to 6h.
  Future<List<Event>> listReceivedEventsForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/received_events'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Event>((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List public events received by a user
  /// > [!NOTE]
  /// > This API is not built to serve real-time use cases. Depending on the
  /// time of day, event latency can be anywhere from 30s to 6h.
  Future<List<Event>> listReceivedPublicEventsForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/received_events/public'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Event>((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repositories starred by a user
  /// Lists repositories a user has starred.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.star+json`**: Includes a timestamp of when
  /// the star was created.
  Future<ActivityListReposStarredByUser200Response> listReposStarredByUser(
    String username, {
    SortStarredParam? sort = SortStarredParam.created,
    DirectionParam? direction = DirectionParam.desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/starred'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActivityListReposStarredByUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repositories watched by a user
  /// Lists repositories a user is watching.
  Future<List<MinimalRepository>> listReposWatchedByUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/subscriptions'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
