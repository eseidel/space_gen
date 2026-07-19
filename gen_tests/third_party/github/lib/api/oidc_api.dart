import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/models/empty_object.dart';
import 'package:github/models/oidc_custom_sub.dart';

/// Endpoints to manage GitHub OIDC configuration using the REST API.
class OidcApi {
  OidcApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get the customization template for an OIDC subject claim for an
  /// organization
  /// Gets the customization template for an OpenID Connect (OIDC) subject
  /// claim.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:org` scope to use this endpoint.
  Future<OidcCustomSub> getOidcCustomSubTemplateForOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/oidc/customization/sub'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OidcCustomSub.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set the customization template for an OIDC subject claim for an
  /// organization
  /// Creates or updates the customization template for an OpenID Connect
  /// (OIDC) subject claim.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<EmptyObject> updateOidcCustomSubTemplateForOrg(
    String org,
    OidcCustomSub oidcCustomSub,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/oidc/customization/sub'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: oidcCustomSub.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
