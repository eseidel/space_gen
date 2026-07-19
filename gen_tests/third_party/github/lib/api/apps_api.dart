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
import 'package:github/messages/apps_check_token_request.dart';
import 'package:github/messages/apps_create_from_manifest201_response.dart';
import 'package:github/messages/apps_create_installation_access_token_request.dart';
import 'package:github/messages/apps_delete_authorization_request.dart';
import 'package:github/messages/apps_delete_token_request.dart';
import 'package:github/messages/apps_list_installation_repos_for_authenticated_user200_response.dart';
import 'package:github/messages/apps_list_installations_for_authenticated_user200_response.dart';
import 'package:github/messages/apps_list_repos_accessible_to_installation200_response.dart';
import 'package:github/messages/apps_reset_token_request.dart';
import 'package:github/messages/apps_scope_token_request.dart';
import 'package:github/messages/apps_update_webhook_config_for_app_request.dart';
import 'package:github/messages/integration_installation_request.dart';
import 'package:github/models/apps_list_accounts_for_plan_parameter2.dart';
import 'package:github/models/apps_list_accounts_for_plan_stubbed_parameter2.dart';
import 'package:github/models/authorization.dart';
import 'package:github/models/hook_delivery.dart';
import 'package:github/models/hook_delivery_item.dart';
import 'package:github/models/installation.dart';
import 'package:github/models/installation_token.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/marketplace_listing_plan.dart';
import 'package:github/models/marketplace_purchase.dart';
import 'package:github/models/sort_param.dart';
import 'package:github/models/user_marketplace_purchase.dart';
import 'package:github/models/webhook_config.dart';

/// Information for integrations and installations.
class AppsApi {
  AppsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get the authenticated app
  /// Returns the GitHub App associated with the authentication credentials
  /// used. To see how many app installations are associated with this GitHub
  /// App, see the `installations_count` in the response. For more details
  /// about your app's installations, see the "[List installations for the
  /// authenticated
  /// app](https://docs.github.com/rest/apps/apps#list-installations-for-the-authenticated-app)"
  /// endpoint.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<Integration> getAuthenticated() async {
    final response = await client.invokeApi(method: Method.get, path: '/app');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Integration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a GitHub App from a manifest
  /// Use this endpoint to complete the handshake necessary when implementing
  /// the [GitHub App Manifest
  /// flow](https://docs.github.com/apps/building-github-apps/creating-github-apps-from-a-manifest/).
  /// When you create a GitHub App with the manifest flow, you receive a
  /// temporary `code` used to retrieve the GitHub App's `id`, `pem` (private
  /// key), and `webhook_secret`.
  Future<AppsCreateFromManifest201Response> createFromManifest(
    String code,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/app-manifests/{code}/conversions'.replaceAll(
        '{code}',
        Uri.encodeComponent(code),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return AppsCreateFromManifest201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a webhook configuration for an app
  /// Returns the webhook configuration for a GitHub App. For more information
  /// about configuring a webhook for your app, see "[Creating a GitHub
  /// App](/developers/apps/creating-a-github-app)."
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<WebhookConfig> getWebhookConfigForApp() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/app/hook/config',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return WebhookConfig.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a webhook configuration for an app
  /// Updates the webhook configuration for a GitHub App. For more information
  /// about configuring a webhook for your app, see "[Creating a GitHub
  /// App](/developers/apps/creating-a-github-app)."
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<WebhookConfig> updateWebhookConfigForApp(
    AppsUpdateWebhookConfigForAppRequest appsUpdateWebhookConfigForAppRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/app/hook/config',
      body: appsUpdateWebhookConfigForAppRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return WebhookConfig.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List deliveries for an app webhook
  /// Returns a list of webhook deliveries for the webhook configured for a
  /// GitHub App.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<List<HookDeliveryItem>> listWebhookDeliveries({
    int? perPage = 30,
    String? cursor,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/app/hook/deliveries',
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (cursor != null) 'cursor': [cursor],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<HookDeliveryItem>(
            (e) => HookDeliveryItem.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a delivery for an app webhook
  /// Returns a delivery for the webhook configured for a GitHub App.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<HookDelivery> getWebhookDelivery(int deliveryId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/app/hook/deliveries/{delivery_id}'.replaceAll(
        '{delivery_id}',
        '$deliveryId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return HookDelivery.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Redeliver a delivery for an app webhook
  /// Redeliver a delivery for the webhook configured for a GitHub App.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<dynamic> redeliverWebhookDelivery(int deliveryId) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/app/hook/deliveries/{delivery_id}/attempts'.replaceAll(
        '{delivery_id}',
        '$deliveryId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List installation requests for the authenticated app
  /// Lists all the pending installation requests for the authenticated GitHub
  /// App.
  Future<List<IntegrationInstallationRequest>>
  listInstallationRequestsForAuthenticatedApp({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/app/installation-requests',
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
          .map<IntegrationInstallationRequest>(
            (e) => IntegrationInstallationRequest.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List installations for the authenticated app
  /// The permissions the installation has are included under the
  /// `permissions` key.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<List<Installation>> listInstallations({
    int? perPage = 30,
    int? page = 1,
    DateTime? since,
    String? outdated,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/app/installations',
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (since != null) 'since': [since.toIso8601String()],
        if (outdated != null) 'outdated': [outdated],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Installation>(
            (e) => Installation.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an installation for the authenticated app
  /// Enables an authenticated GitHub App to find an installation's
  /// information using the installation id.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  /// [installationId] example: `1`
  Future<Installation> getInstallation(int installationId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/app/installations/{installation_id}'.replaceAll(
        '{installation_id}',
        '$installationId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Installation.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an installation for the authenticated app
  /// Uninstalls a GitHub App on a user, organization, or business account. If
  /// you prefer to temporarily suspend an app's access to your account's
  /// resources, then we recommend the "[Suspend an app
  /// installation](https://docs.github.com/rest/apps/apps#suspend-an-app-installation)"
  /// endpoint.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  /// [installationId] example: `1`
  Future<void> deleteInstallation(int installationId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/app/installations/{installation_id}'.replaceAll(
        '{installation_id}',
        '$installationId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Create an installation access token for an app
  /// Creates an installation access token that enables a GitHub App to make
  /// authenticated API requests for the app's installation on an organization
  /// or individual account. Installation tokens expire one hour from the time
  /// you create them. Using an expired token produces a status code of `401 - Unauthorized`,
  /// and requires creating a new installation token. By default the
  /// installation token has access to all repositories that the installation
  /// can access.
  ///
  /// Optionally, you can use the `repositories` or `repository_ids` body
  /// parameters to specify individual repositories that the installation
  /// access token can access. If you don't use `repositories` or
  /// `repository_ids` to grant access to specific repositories, the
  /// installation access token will have access to all repositories that the
  /// installation was granted access to. The installation access token cannot
  /// be granted access to repositories that the installation was not granted
  /// access to. Up to 500 repositories can be listed in this manner.
  ///
  /// Optionally, use the `permissions` body parameter to specify the
  /// permissions that the installation access token should have. If
  /// `permissions` is not specified, the installation access token will have
  /// all of the permissions that were granted to the app. The installation
  /// access token cannot be granted permissions that the app was not granted.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  /// [installationId] example: `1`
  Future<InstallationToken> createInstallationAccessToken(
    int installationId, {
    AppsCreateInstallationAccessTokenRequest?
    appsCreateInstallationAccessTokenRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/app/installations/{installation_id}/access_tokens'.replaceAll(
        '{installation_id}',
        '$installationId',
      ),
      body: appsCreateInstallationAccessTokenRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return InstallationToken.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Suspend an app installation
  /// Suspends a GitHub App on a user, organization, or business account,
  /// which blocks the app from accessing the account's resources. When a
  /// GitHub App is suspended, the app's access to the GitHub API or webhook
  /// events is blocked for that account.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  /// [installationId] example: `1`
  Future<void> suspendInstallation(int installationId) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/app/installations/{installation_id}/suspended'.replaceAll(
        '{installation_id}',
        '$installationId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Unsuspend an app installation
  /// Removes a GitHub App installation suspension.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  /// [installationId] example: `1`
  Future<void> unsuspendInstallation(int installationId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/app/installations/{installation_id}/suspended'.replaceAll(
        '{installation_id}',
        '$installationId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Delete an app authorization
  /// OAuth and GitHub application owners can revoke a grant for their
  /// application and a specific user. You must provide a valid OAuth
  /// `access_token` as an input parameter and the grant for the token's owner
  /// will be deleted.
  /// Deleting an application's grant will also delete all OAuth tokens
  /// associated with the application for the user. Once deleted, the
  /// application will have no access to the user's account and will no longer
  /// be listed on [the application authorizations settings screen within
  /// GitHub](https://github.com/settings/applications#authorized).
  /// [clientId] example: `'Iv1.8a61f9b3a7aba766'`
  Future<void> deleteAuthorization(
    String clientId,
    AppsDeleteAuthorizationRequest appsDeleteAuthorizationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/applications/{client_id}/grant'.replaceAll(
        '{client_id}',
        Uri.encodeComponent(clientId),
      ),
      body: appsDeleteAuthorizationRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Check a token
  /// OAuth applications and GitHub applications with OAuth authorizations can
  /// use this API method for checking OAuth token validity without exceeding
  /// the normal rate limits for failed login attempts. Authentication works
  /// differently with this particular endpoint. Invalid tokens will return
  /// `404 NOT FOUND`.
  /// [clientId] example: `'Iv1.8a61f9b3a7aba766'`
  Future<Authorization> checkToken(
    String clientId,
    AppsCheckTokenRequest appsCheckTokenRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/applications/{client_id}/token'.replaceAll(
        '{client_id}',
        Uri.encodeComponent(clientId),
      ),
      body: appsCheckTokenRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Authorization.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an app token
  /// OAuth  or GitHub application owners can revoke a single token for an
  /// OAuth application or a GitHub application with an OAuth authorization.
  /// [clientId] example: `'Iv1.8a61f9b3a7aba766'`
  Future<void> deleteToken(
    String clientId,
    AppsDeleteTokenRequest appsDeleteTokenRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/applications/{client_id}/token'.replaceAll(
        '{client_id}',
        Uri.encodeComponent(clientId),
      ),
      body: appsDeleteTokenRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Reset a token
  /// OAuth applications and GitHub applications with OAuth authorizations can
  /// use this API method to reset a valid OAuth token without end-user
  /// involvement. Applications must save the "token" property in the response
  /// because changes take effect immediately. Invalid tokens will return `404 NOT FOUND`.
  /// [clientId] example: `'Iv1.8a61f9b3a7aba766'`
  Future<Authorization> resetToken(
    String clientId,
    AppsResetTokenRequest appsResetTokenRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/applications/{client_id}/token'.replaceAll(
        '{client_id}',
        Uri.encodeComponent(clientId),
      ),
      body: appsResetTokenRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Authorization.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a scoped access token
  /// Use a non-scoped user access token to create a repository-scoped and/or
  /// permission-scoped user access token. You can specify
  /// which repositories the token can access and which permissions are
  /// granted to the
  /// token.
  ///
  /// Invalid tokens will return `404 NOT FOUND`.
  /// [clientId] example: `'Iv1.8a61f9b3a7aba766'`
  Future<Authorization> scopeToken(
    String clientId,
    AppsScopeTokenRequest appsScopeTokenRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/applications/{client_id}/token/scoped'.replaceAll(
        '{client_id}',
        Uri.encodeComponent(clientId),
      ),
      body: appsScopeTokenRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Authorization.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an app
  /// > [!NOTE]
  /// > The `:app_slug` is just the URL-friendly name of your GitHub App. You
  /// can find this on the settings page for your GitHub App (e.g.,
  /// `https://github.com/settings/apps/:app_slug`).
  Future<Integration> getBySlug(String appSlug) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/apps/{app_slug}'.replaceAll(
        '{app_slug}',
        Uri.encodeComponent(appSlug),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Integration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repositories accessible to the app installation
  /// List repositories that an app installation can access.
  Future<AppsListReposAccessibleToInstallation200Response>
  listReposAccessibleToInstallation({int? perPage = 30, int? page = 1}) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/installation/repositories',
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return AppsListReposAccessibleToInstallation200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Revoke an installation access token
  /// Revokes the installation token you're using to authenticate as an
  /// installation and access this endpoint.
  ///
  /// Once an installation token is revoked, the token is invalidated and
  /// cannot be used. Other endpoints that require the revoked installation
  /// token must have a new installation token to work. You can create a new
  /// token using the "[Create an installation access token for an
  /// app](https://docs.github.com/rest/apps/apps#create-an-installation-access-token-for-an-app)"
  /// endpoint.
  Future<void> revokeInstallationAccessToken() async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/installation/token',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a subscription plan for an account
  /// Shows whether the user or organization account actively subscribes to a
  /// plan listed by the authenticated GitHub App. When someone submits a plan
  /// change that won't be processed until the end of their billing cycle, you
  /// will also see the upcoming pending change.
  ///
  /// GitHub Apps must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint. OAuth apps must use [basic
  /// authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication)
  /// with their client ID and client secret to access this endpoint.
  Future<MarketplacePurchase> getSubscriptionPlanForAccount(
    int accountId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/marketplace_listing/accounts/{account_id}'.replaceAll(
        '{account_id}',
        '$accountId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return MarketplacePurchase.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List plans
  /// Lists all plans that are part of your GitHub Marketplace listing.
  ///
  /// GitHub Apps must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint. OAuth apps must use [basic
  /// authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication)
  /// with their client ID and client secret to access this endpoint.
  Future<List<MarketplaceListingPlan>> listPlans({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/marketplace_listing/plans',
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
          .map<MarketplaceListingPlan>(
            (e) => MarketplaceListingPlan.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List accounts for a plan
  /// Returns user and organization accounts associated with the specified
  /// plan, including free plans. For per-seat pricing, you see the list of
  /// accounts that have purchased the plan, including the number of seats
  /// purchased. When someone submits a plan change that won't be processed
  /// until the end of their billing cycle, you will also see the upcoming
  /// pending change.
  ///
  /// GitHub Apps must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint. OAuth apps must use [basic
  /// authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication)
  /// with their client ID and client secret to access this endpoint.
  Future<List<MarketplacePurchase>> listAccountsForPlan(
    int planId, {
    SortParam? sort = SortParam.created,
    AppsListAccountsForPlanParameter2? direction,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/marketplace_listing/plans/{plan_id}/accounts'.replaceAll(
        '{plan_id}',
        '$planId',
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
      return (jsonDecode(response.body) as List)
          .map<MarketplacePurchase>(
            (e) => MarketplacePurchase.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a subscription plan for an account (stubbed)
  /// Shows whether the user or organization account actively subscribes to a
  /// plan listed by the authenticated GitHub App. When someone submits a plan
  /// change that won't be processed until the end of their billing cycle, you
  /// will also see the upcoming pending change.
  ///
  /// GitHub Apps must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint. OAuth apps must use [basic
  /// authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication)
  /// with their client ID and client secret to access this endpoint.
  Future<MarketplacePurchase> getSubscriptionPlanForAccountStubbed(
    int accountId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/marketplace_listing/stubbed/accounts/{account_id}'.replaceAll(
        '{account_id}',
        '$accountId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return MarketplacePurchase.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List plans (stubbed)
  /// Lists all plans that are part of your GitHub Marketplace listing.
  ///
  /// GitHub Apps must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint. OAuth apps must use [basic
  /// authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication)
  /// with their client ID and client secret to access this endpoint.
  Future<List<MarketplaceListingPlan>> listPlansStubbed({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/marketplace_listing/stubbed/plans',
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
          .map<MarketplaceListingPlan>(
            (e) => MarketplaceListingPlan.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List accounts for a plan (stubbed)
  /// Returns repository and organization accounts associated with the
  /// specified plan, including free plans. For per-seat pricing, you see the
  /// list of accounts that have purchased the plan, including the number of
  /// seats purchased. When someone submits a plan change that won't be
  /// processed until the end of their billing cycle, you will also see the
  /// upcoming pending change.
  ///
  /// GitHub Apps must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint. OAuth apps must use [basic
  /// authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication)
  /// with their client ID and client secret to access this endpoint.
  Future<List<MarketplacePurchase>> listAccountsForPlanStubbed(
    int planId, {
    SortParam? sort = SortParam.created,
    AppsListAccountsForPlanStubbedParameter2? direction,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/marketplace_listing/stubbed/plans/{plan_id}/accounts'.replaceAll(
        '{plan_id}',
        '$planId',
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
      return (jsonDecode(response.body) as List)
          .map<MarketplacePurchase>(
            (e) => MarketplacePurchase.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization installation for the authenticated app
  /// Enables an authenticated GitHub App to find the organization's
  /// installation information.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<Installation> getOrgInstallation(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/installation'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Installation.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository installation for the authenticated app
  /// Enables an authenticated GitHub App to find the repository's
  /// installation information. The installation's account type will be either
  /// an organization or a user account, depending which account the
  /// repository belongs to.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<Installation> getRepoInstallation(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/installation'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Installation.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List app installations accessible to the user access token
  /// Lists installations of your GitHub App that the authenticated user has
  /// explicit permission (`:read`, `:write`, or `:admin`) to access.
  ///
  /// The authenticated user has explicit permission to access repositories
  /// they own, repositories where they are a collaborator, and repositories
  /// that they can access through an organization membership.
  ///
  /// You can find the permissions for the installation under the
  /// `permissions` key.
  Future<AppsListInstallationsForAuthenticatedUser200Response>
  listInstallationsForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/installations',
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return AppsListInstallationsForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repositories accessible to the user access token
  /// List repositories that the authenticated user has explicit permission
  /// (`:read`, `:write`, or `:admin`) to access for an installation.
  ///
  /// The authenticated user has explicit permission to access repositories
  /// they own, repositories where they are a collaborator, and repositories
  /// that they can access through an organization membership.
  ///
  /// The access the user has to each repository is included in the hash under
  /// the `permissions` key.
  /// [installationId] example: `1`
  Future<AppsListInstallationReposForAuthenticatedUser200Response>
  listInstallationReposForAuthenticatedUser(
    int installationId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/installations/{installation_id}/repositories'.replaceAll(
        '{installation_id}',
        '$installationId',
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
      return AppsListInstallationReposForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add a repository to an app installation
  /// Add a single repository to an installation. The authenticated user must
  /// have admin access to the repository.
  ///
  /// This endpoint only works for PATs (classic) with the `repo` scope.
  /// [installationId] example: `1`
  Future<void> addRepoToInstallationForAuthenticatedUser(
    int installationId,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/user/installations/{installation_id}/repositories/{repository_id}'
          .replaceAll('{installation_id}', '$installationId')
          .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove a repository from an app installation
  /// Remove a single repository from an installation. The authenticated user
  /// must have admin access to the repository. The installation must have the
  /// `repository_selection` of `selected`.
  ///
  /// This endpoint only works for PATs (classic) with the `repo` scope.
  /// [installationId] example: `1`
  Future<void> removeRepoFromInstallationForAuthenticatedUser(
    int installationId,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/installations/{installation_id}/repositories/{repository_id}'
          .replaceAll('{installation_id}', '$installationId')
          .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List subscriptions for the authenticated user
  /// Lists the active subscriptions for the authenticated user.
  Future<List<UserMarketplacePurchase>> listSubscriptionsForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/marketplace_purchases',
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
          .map<UserMarketplacePurchase>(
            (e) => UserMarketplacePurchase.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List subscriptions for the authenticated user (stubbed)
  /// Lists the active subscriptions for the authenticated user.
  Future<List<UserMarketplacePurchase>>
  listSubscriptionsForAuthenticatedUserStubbed({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/marketplace_purchases/stubbed',
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
          .map<UserMarketplacePurchase>(
            (e) => UserMarketplacePurchase.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a user installation for the authenticated app
  /// Enables an authenticated GitHub App to find the user’s installation
  /// information.
  ///
  /// You must use a
  /// [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app)
  /// to access this endpoint.
  Future<Installation> getUserInstallation(String username) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/installation'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Installation.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
