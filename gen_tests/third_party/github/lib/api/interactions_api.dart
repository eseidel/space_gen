import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/interaction_limit_response.dart';
import 'package:github/messages/interactions_get_restrictions_for_authenticated_user200_response.dart';
import 'package:github/messages/interactions_get_restrictions_for_org200_response.dart';
import 'package:github/messages/interactions_get_restrictions_for_repo200_response.dart';
import 'package:github/models/interaction_limit.dart';
import 'package:meta/meta.dart';

sealed class InteractionsGetRestrictionsForAuthenticatedUserResponse {
  const InteractionsGetRestrictionsForAuthenticatedUserResponse();
}

@immutable
final class InteractionsGetRestrictionsForAuthenticatedUserResponse200
    extends InteractionsGetRestrictionsForAuthenticatedUserResponse {
  const InteractionsGetRestrictionsForAuthenticatedUserResponse200(this.value);

  final InteractionsGetRestrictionsForAuthenticatedUser200Response value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is InteractionsGetRestrictionsForAuthenticatedUserResponse200 &&
        value == other.value;
  }
}

@immutable
final class InteractionsGetRestrictionsForAuthenticatedUserResponse204
    extends InteractionsGetRestrictionsForAuthenticatedUserResponse {
  const InteractionsGetRestrictionsForAuthenticatedUserResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is InteractionsGetRestrictionsForAuthenticatedUserResponse204;
}

/// Owner or admin management of users interactions.
class InteractionsApi {
  InteractionsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get interaction restrictions for an organization
  /// Shows which type of GitHub user can interact with this organization and
  /// when the restriction expires. If there is no restrictions, you will see
  /// an empty response.
  Future<InteractionsGetRestrictionsForOrg200Response> getRestrictionsForOrg(
    String org,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/interaction-limits'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return InteractionsGetRestrictionsForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set interaction restrictions for an organization
  /// Temporarily restricts interactions to a certain type of GitHub user in
  /// any public repository in the given organization. You must be an
  /// organization owner to set these restrictions. Setting the interaction
  /// limit at the organization level will overwrite any interaction limits
  /// that are set for individual repositories owned by the organization.
  Future<InteractionLimitResponse> setRestrictionsForOrg(
    String org,
    InteractionLimit interactionLimit,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/interaction-limits'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: interactionLimit.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return InteractionLimitResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove interaction restrictions for an organization
  /// Removes all interaction restrictions from public repositories in the
  /// given organization. You must be an organization owner to remove
  /// restrictions.
  Future<void> removeRestrictionsForOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/interaction-limits'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get interaction restrictions for a repository
  /// Shows which type of GitHub user can interact with this repository and
  /// when the restriction expires. If there are no restrictions, you will see
  /// an empty response.
  Future<InteractionsGetRestrictionsForRepo200Response> getRestrictionsForRepo(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/interaction-limits'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return InteractionsGetRestrictionsForRepo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set interaction restrictions for a repository
  /// Temporarily restricts interactions to a certain type of GitHub user
  /// within the given repository. You must have owner or admin access to set
  /// these restrictions. If an interaction limit is set for the user or
  /// organization that owns this repository, you will receive a `409 Conflict`
  /// response and will not be able to use this endpoint to change the
  /// interaction limit for a single repository.
  Future<InteractionLimitResponse> setRestrictionsForRepo(
    String owner,
    String repo,
    InteractionLimit interactionLimit,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/interaction-limits'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: interactionLimit.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return InteractionLimitResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove interaction restrictions for a repository
  /// Removes all interaction restrictions from the given repository. You must
  /// have owner or admin access to remove restrictions. If the interaction
  /// limit is set for the user or organization that owns this repository, you
  /// will receive a `409 Conflict` response and will not be able to use this
  /// endpoint to change the interaction limit for a single repository.
  Future<void> removeRestrictionsForRepo(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/interaction-limits'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get interaction restrictions for your public repositories
  /// Shows which type of GitHub user can interact with your public
  /// repositories and when the restriction expires.
  Future<InteractionsGetRestrictionsForAuthenticatedUserResponse>
  getRestrictionsForAuthenticatedUser() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/interaction-limits',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => InteractionsGetRestrictionsForAuthenticatedUserResponse200(
        InteractionsGetRestrictionsForAuthenticatedUser200Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const InteractionsGetRestrictionsForAuthenticatedUserResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Set interaction restrictions for your public repositories
  /// Temporarily restricts which type of GitHub user can interact with your
  /// public repositories. Setting the interaction limit at the user level
  /// will overwrite any interaction limits that are set for individual
  /// repositories owned by the user.
  Future<InteractionLimitResponse> setRestrictionsForAuthenticatedUser(
    InteractionLimit interactionLimit,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/user/interaction-limits',
      body: interactionLimit.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return InteractionLimitResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove interaction restrictions from your public repositories
  /// Removes any interaction restrictions from your public repositories.
  Future<void> removeRestrictionsForAuthenticatedUser() async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/interaction-limits',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
