// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/search_code200_response.dart';
import 'package:github/messages/search_commits200_response.dart';
import 'package:github/messages/search_issues_and_pull_requests200_response.dart';
import 'package:github/messages/search_labels200_response.dart';
import 'package:github/messages/search_repos200_response.dart';
import 'package:github/messages/search_topics200_response.dart';
import 'package:github/messages/search_users200_response.dart';
import 'package:github/models/order_param.dart';
import 'package:github/models/search_code_parameter1.dart';
import 'package:github/models/search_code_parameter2.dart';
import 'package:github/models/search_commits_parameter1.dart';
import 'package:github/models/search_issues_and_pull_requests_parameter1.dart';
import 'package:github/models/search_labels_parameter2.dart';
import 'package:github/models/search_repos_parameter1.dart';
import 'package:github/models/search_users_parameter1.dart';

/// Look for stuff on GitHub.
class SearchApi {
  SearchApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Search code
  /// Searches for query terms inside of a file. This method returns up to 100
  /// results [per
  /// page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).
  ///
  /// When searching for code, you can get text match metadata for the file
  /// **content** and file **path** fields when you pass the `text-match`
  /// media type. For more details about how to receive highlighted search
  /// results, see [Text match
  /// metadata](https://docs.github.com/rest/search/search#text-match-metadata).
  ///
  /// For example, if you want to find the definition of the `addClass`
  /// function inside [jQuery](https://github.com/jquery/jquery) repository,
  /// your query would look something like this:
  ///
  /// `q=addClass+in:file+language:js+repo:jquery/jquery`
  ///
  /// This query searches for the keyword `addClass` within a file's contents.
  /// The query limits the search to files where the language is JavaScript in
  /// the `jquery/jquery` repository.
  ///
  /// Considerations for code search:
  ///
  /// Due to the complexity of searching code, there are a few restrictions on
  /// how searches are performed:
  ///
  /// *   Only the _default branch_ is considered. In most cases, this will be
  /// the `master` branch.
  /// *   Only files smaller than 384 KB are searchable.
  /// *   You must always include at least one search term when searching
  /// source code. For example, searching for
  /// [`language:go`](https://github.com/search?utf8=%E2%9C%93&q=language%3Ago&type=Code)
  /// is not valid, while [`amazing
  /// language:go`](https://github.com/search?utf8=%E2%9C%93&q=amazing+language%3Ago&type=Code) is.
  ///
  /// This endpoint requires you to authenticate and limits you to 10 requests
  /// per minute.
  Future<SearchCode200Response> code(
    String q, {
    SearchCodeParameter1? sort,
    SearchCodeParameter2? order = .desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/search/code',
      queryParameters: {
        'q': [q],
        if (sort != null) 'sort': [sort.toJson()],
        if (order != null) 'order': [order.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SearchCode200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Search commits
  /// Find commits via various criteria on the default branch (usually
  /// `main`). This method returns up to 100 results [per
  /// page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).
  ///
  /// When searching for commits, you can get text match metadata for the
  /// **message** field when you provide the `text-match` media type. For more
  /// details about how to receive highlighted search results, see [Text match
  /// metadata](https://docs.github.com/rest/search/search#text-match-metadata).
  ///
  /// For example, if you want to find commits related to CSS in the
  /// [octocat/Spoon-Knife](https://github.com/octocat/Spoon-Knife)
  /// repository. Your query would look something like this:
  ///
  /// `q=repo:octocat/Spoon-Knife+css`
  Future<SearchCommits200Response> commits(
    String q, {
    SearchCommitsParameter1? sort,
    OrderParam? order = .desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/search/commits',
      queryParameters: {
        'q': [q],
        if (sort != null) 'sort': [sort.toJson()],
        if (order != null) 'order': [order.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SearchCommits200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Search issues and pull requests
  /// > [!WARNING]
  /// > **Notice:** Search for issues and pull requests will be overridden by
  /// advanced search on September 4, 2025.
  /// > You can read more about this change on [the GitHub
  /// blog](https://github.blog/changelog/2025-03-06-github-issues-projects-api-support-for-issues-advanced-search-and-more/).
  Future<SearchIssuesAndPullRequests200Response> issuesAndPullRequests(
    String q, {
    SearchIssuesAndPullRequestsParameter1? sort,
    OrderParam? order = .desc,
    int? perPage = 30,
    int? page = 1,
    String? advancedSearch,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/search/issues',
      queryParameters: {
        'q': [q],
        if (sort != null) 'sort': [sort.toJson()],
        if (order != null) 'order': [order.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (advancedSearch != null) 'advanced_search': [advancedSearch],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SearchIssuesAndPullRequests200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Search labels
  /// Find labels in a repository with names or descriptions that match search
  /// keywords. Returns up to 100 results [per
  /// page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).
  ///
  /// When searching for labels, you can get text match metadata for the label
  /// **name** and **description** fields when you pass the `text-match` media
  /// type. For more details about how to receive highlighted search results,
  /// see [Text match
  /// metadata](https://docs.github.com/rest/search/search#text-match-metadata).
  ///
  /// For example, if you want to find labels in the `linguist` repository
  /// that match `bug`, `defect`, or `enhancement`. Your query might look like
  /// this:
  ///
  /// `q=bug+defect+enhancement&repository_id=64778136`
  ///
  /// The labels that best match the query appear first in the search results.
  Future<SearchLabels200Response> labels(
    int repositoryId,
    String q, {
    SearchLabelsParameter2? sort,
    OrderParam? order = .desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/search/labels',
      queryParameters: {
        'repository_id': [repositoryId.toString()],
        'q': [q],
        if (sort != null) 'sort': [sort.toJson()],
        if (order != null) 'order': [order.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SearchLabels200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Search repositories
  /// Find repositories via various criteria. This method returns up to 100
  /// results [per
  /// page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).
  ///
  /// When searching for repositories, you can get text match metadata for the
  /// **name** and **description** fields when you pass the `text-match` media
  /// type. For more details about how to receive highlighted search results,
  /// see [Text match
  /// metadata](https://docs.github.com/rest/search/search#text-match-metadata).
  ///
  /// For example, if you want to search for popular Tetris repositories
  /// written in assembly code, your query might look like this:
  ///
  /// `q=tetris+language:assembly&sort=stars&order=desc`
  ///
  /// This query searches for repositories with the word `tetris` in the name,
  /// the description, or the README. The results are limited to repositories
  /// where the primary language is assembly. The results are sorted by stars
  /// in descending order, so that the most popular repositories appear first
  /// in the search results.
  Future<SearchRepos200Response> repos(
    String q, {
    SearchReposParameter1? sort,
    OrderParam? order = .desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/search/repositories',
      queryParameters: {
        'q': [q],
        if (sort != null) 'sort': [sort.toJson()],
        if (order != null) 'order': [order.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SearchRepos200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Search topics
  /// Find topics via various criteria. Results are sorted by best match. This
  /// method returns up to 100 results [per
  /// page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).
  /// See "[Searching
  /// topics](https://docs.github.com/articles/searching-topics/)" for a
  /// detailed list of qualifiers.
  ///
  /// When searching for topics, you can get text match metadata for the
  /// topic's **short\_description**, **description**, **name**, or
  /// **display\_name** field when you pass the `text-match` media type. For
  /// more details about how to receive highlighted search results, see [Text
  /// match
  /// metadata](https://docs.github.com/rest/search/search#text-match-metadata).
  ///
  /// For example, if you want to search for topics related to Ruby that are
  /// featured on https://github.com/topics. Your query might look like this:
  ///
  /// `q=ruby+is:featured`
  ///
  /// This query searches for topics with the keyword `ruby` and limits the
  /// results to find only topics that are featured. The topics that are the
  /// best match for the query appear first in the search results.
  Future<SearchTopics200Response> topics(
    String q, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/search/topics',
      queryParameters: {
        'q': [q],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SearchTopics200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Search users
  /// Find users via various criteria. This method returns up to 100 results
  /// [per
  /// page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).
  ///
  /// When searching for users, you can get text match metadata for the issue
  /// **login**, public **email**, and **name** fields when you pass the
  /// `text-match` media type. For more details about highlighting search
  /// results, see [Text match
  /// metadata](https://docs.github.com/rest/search/search#text-match-metadata).
  /// For more details about how to receive highlighted search results, see
  /// [Text match
  /// metadata](https://docs.github.com/rest/search/search#text-match-metadata).
  ///
  /// For example, if you're looking for a list of popular users, you might
  /// try this query:
  ///
  /// `q=tom+repos:%3E42+followers:%3E1000`
  ///
  /// This query searches for users with the name `tom`. The results are
  /// restricted to users with more than 42 repositories and over 1,000
  /// followers.
  ///
  /// This endpoint does not accept authentication and will only include
  /// publicly visible users. As an alternative, you can use the GraphQL API.
  /// The GraphQL API requires authentication and will return private users,
  /// including Enterprise Managed Users (EMUs), that you are authorized to
  /// view. For more information, see "[GraphQL
  /// Queries](https://docs.github.com/graphql/reference/queries#search)."
  Future<SearchUsers200Response> users(
    String q, {
    SearchUsersParameter1? sort,
    OrderParam? order = .desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/search/users',
      queryParameters: {
        'q': [q],
        if (sort != null) 'sort': [sort.toJson()],
        if (order != null) 'order': [order.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SearchUsers200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
