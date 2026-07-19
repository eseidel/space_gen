// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/models/package.dart';
import 'package:github/models/package_type_param.dart';
import 'package:github/models/package_version.dart';
import 'package:github/models/package_visibility_param.dart';
import 'package:github/models/packages_get_all_package_versions_for_package_owned_by_authenticated_user_parameter4.dart';
import 'package:github/models/packages_get_all_package_versions_for_package_owned_by_org_parameter5.dart';
import 'package:github/models/packages_list_packages_for_authenticated_user_parameter0.dart';
import 'package:github/models/packages_list_packages_for_organization_parameter0.dart';
import 'package:github/models/packages_list_packages_for_user_parameter0.dart';

/// Manage packages for authenticated users and organizations.
class PackagesApi {
  PackagesApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get list of conflicting packages during Docker migration for
  /// organization
  /// Lists all packages that are in a specific organization, are readable by
  /// the requesting user, and that encountered a conflict during a Docker
  /// migration.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint.
  Future<List<Package>> listDockerMigrationConflictingPackagesForOrganization(
    String org,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/docker/conflicts'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Package>((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List packages for an organization
  /// Lists packages in an organization readable by the user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<List<Package>> listPackagesForOrganization(
    PackagesListPackagesForOrganizationParameter0 packageType,
    String org, {
    PackageVisibilityParam? visibility,
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/packages'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        'package_type': [packageType.toJson()],
        if (visibility != null) 'visibility': [visibility.toJson()],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Package>((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a package for an organization
  /// Gets a specific package in an organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<Package> getPackageForOrganization(
    PackageTypeParam packageType,
    String packageName,
    String org,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/packages/{package_type}/{package_name}'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName))
          .replaceAll('{org}', Uri.encodeComponent(org)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Package.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a package for an organization
  /// Deletes an entire package in an organization. You cannot delete a public
  /// package if any version of the package has more than 5,000 downloads. In
  /// this scenario, contact GitHub support for further assistance.
  ///
  /// The authenticated user must have admin permissions in the organization
  /// to use this endpoint. If the `package_type` belongs to a GitHub Packages
  /// registry that supports granular permissions, the authenticated user must
  /// also have admin permissions to the package. For the list of these
  /// registries, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `delete:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> deletePackageForOrg(
    PackageTypeParam packageType,
    String packageName,
    String org,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/packages/{package_type}/{package_name}'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName))
          .replaceAll('{org}', Uri.encodeComponent(org)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Restore a package for an organization
  /// Restores an entire package in an organization.
  ///
  /// You can restore a deleted package under the following conditions:
  ///   - The package was deleted within the last 30 days.
  /// - The same package namespace and version is still available and not
  /// reused for a new package. If the same package namespace is not
  /// available, you will not be able to restore your package. In this
  /// scenario, to restore the deleted package, you must delete the new
  /// package that uses the deleted package's namespace first.
  ///
  /// The authenticated user must have admin permissions in the organization
  /// to use this endpoint. If the `package_type` belongs to a GitHub Packages
  /// registry that supports granular permissions, the authenticated user must
  /// also have admin permissions to the package. For the list of these
  /// registries, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `write:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> restorePackageForOrg(
    PackageTypeParam packageType,
    String packageName,
    String org, {
    String? token,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/packages/{package_type}/{package_name}/restore'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName))
          .replaceAll('{org}', Uri.encodeComponent(org)),
      queryParameters: {
        if (token != null) 'token': [token],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List package versions for a package owned by an organization
  /// Lists package versions for a package owned by an organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<List<PackageVersion>> getAllPackageVersionsForPackageOwnedByOrg(
    PackageTypeParam packageType,
    String packageName,
    String org, {
    int? page = 1,
    int? perPage = 30,
    PackagesGetAllPackageVersionsForPackageOwnedByOrgParameter5? state =
        PackagesGetAllPackageVersionsForPackageOwnedByOrgParameter5.active,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/packages/{package_type}/{package_name}/versions'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName))
          .replaceAll('{org}', Uri.encodeComponent(org)),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (state != null) 'state': [state.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<PackageVersion>(
            (e) => PackageVersion.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a package version for an organization
  /// Gets a specific package version in an organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<PackageVersion> getPackageVersionForOrganization(
    PackageTypeParam packageType,
    String packageName,
    String org,
    int packageVersionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}'
              .replaceAll(
                '{package_type}',
                Uri.encodeComponent(packageType.toJson()),
              )
              .replaceAll('{package_name}', Uri.encodeComponent(packageName))
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{package_version_id}', '$packageVersionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PackageVersion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete package version for an organization
  /// Deletes a specific package version in an organization. If the package is
  /// public and the package version has more than 5,000 downloads, you cannot
  /// delete the package version. In this scenario, contact GitHub support for
  /// further assistance.
  ///
  /// The authenticated user must have admin permissions in the organization
  /// to use this endpoint. If the `package_type` belongs to a GitHub Packages
  /// registry that supports granular permissions, the authenticated user must
  /// also have admin permissions to the package. For the list of these
  /// registries, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `delete:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> deletePackageVersionForOrg(
    PackageTypeParam packageType,
    String packageName,
    String org,
    int packageVersionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}'
              .replaceAll(
                '{package_type}',
                Uri.encodeComponent(packageType.toJson()),
              )
              .replaceAll('{package_name}', Uri.encodeComponent(packageName))
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{package_version_id}', '$packageVersionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Restore package version for an organization
  /// Restores a specific package version in an organization.
  ///
  /// You can restore a deleted package under the following conditions:
  ///   - The package was deleted within the last 30 days.
  /// - The same package namespace and version is still available and not
  /// reused for a new package. If the same package namespace is not
  /// available, you will not be able to restore your package. In this
  /// scenario, to restore the deleted package, you must delete the new
  /// package that uses the deleted package's namespace first.
  ///
  /// The authenticated user must have admin permissions in the organization
  /// to use this endpoint. If the `package_type` belongs to a GitHub Packages
  /// registry that supports granular permissions, the authenticated user must
  /// also have admin permissions to the package. For the list of these
  /// registries, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `write:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> restorePackageVersionForOrg(
    PackageTypeParam packageType,
    String packageName,
    String org,
    int packageVersionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore'
              .replaceAll(
                '{package_type}',
                Uri.encodeComponent(packageType.toJson()),
              )
              .replaceAll('{package_name}', Uri.encodeComponent(packageName))
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{package_version_id}', '$packageVersionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get list of conflicting packages during Docker migration for
  /// authenticated-user
  /// Lists all packages that are owned by the authenticated user within the
  /// user's namespace, and that encountered a conflict during a Docker
  /// migration.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint.
  Future<List<Package>>
  listDockerMigrationConflictingPackagesForAuthenticatedUser() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/docker/conflicts',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Package>((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List packages for the authenticated user's namespace
  /// Lists packages owned by the authenticated user within the user's
  /// namespace.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<List<Package>> listPackagesForAuthenticatedUser(
    PackagesListPackagesForAuthenticatedUserParameter0 packageType, {
    PackageVisibilityParam? visibility,
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/packages',
      queryParameters: {
        'package_type': [packageType.toJson()],
        if (visibility != null) 'visibility': [visibility.toJson()],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Package>((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a package for the authenticated user
  /// Gets a specific package for a package owned by the authenticated user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<Package> getPackageForAuthenticatedUser(
    PackageTypeParam packageType,
    String packageName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/packages/{package_type}/{package_name}'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Package.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a package for the authenticated user
  /// Deletes a package owned by the authenticated user. You cannot delete a
  /// public package if any version of the package has more than 5,000
  /// downloads. In this scenario, contact GitHub support for further
  /// assistance.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `delete:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> deletePackageForAuthenticatedUser(
    PackageTypeParam packageType,
    String packageName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/packages/{package_type}/{package_name}'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Restore a package for the authenticated user
  /// Restores a package owned by the authenticated user.
  ///
  /// You can restore a deleted package under the following conditions:
  ///   - The package was deleted within the last 30 days.
  /// - The same package namespace and version is still available and not
  /// reused for a new package. If the same package namespace is not
  /// available, you will not be able to restore your package. In this
  /// scenario, to restore the deleted package, you must delete the new
  /// package that uses the deleted package's namespace first.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `write:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> restorePackageForAuthenticatedUser(
    PackageTypeParam packageType,
    String packageName, {
    String? token,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/packages/{package_type}/{package_name}/restore'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName)),
      queryParameters: {
        if (token != null) 'token': [token],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List package versions for a package owned by the authenticated user
  /// Lists package versions for a package owned by the authenticated user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<List<PackageVersion>>
  getAllPackageVersionsForPackageOwnedByAuthenticatedUser(
    PackageTypeParam packageType,
    String packageName, {
    int? page = 1,
    int? perPage = 30,
    PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4?
        state =
        PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4
            .active,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/packages/{package_type}/{package_name}/versions'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName)),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (state != null) 'state': [state.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<PackageVersion>(
            (e) => PackageVersion.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a package version for the authenticated user
  /// Gets a specific package version for a package owned by the authenticated
  /// user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<PackageVersion> getPackageVersionForAuthenticatedUser(
    PackageTypeParam packageType,
    String packageName,
    int packageVersionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/user/packages/{package_type}/{package_name}/versions/{package_version_id}'
              .replaceAll(
                '{package_type}',
                Uri.encodeComponent(packageType.toJson()),
              )
              .replaceAll('{package_name}', Uri.encodeComponent(packageName))
              .replaceAll('{package_version_id}', '$packageVersionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PackageVersion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a package version for the authenticated user
  /// Deletes a specific package version for a package owned by the
  /// authenticated user.  If the package is public and the package version
  /// has more than 5,000 downloads, you cannot delete the package version. In
  /// this scenario, contact GitHub support for further assistance.
  ///
  /// The authenticated user must have admin permissions in the organization
  /// to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `delete:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> deletePackageVersionForAuthenticatedUser(
    PackageTypeParam packageType,
    String packageName,
    int packageVersionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/user/packages/{package_type}/{package_name}/versions/{package_version_id}'
              .replaceAll(
                '{package_type}',
                Uri.encodeComponent(packageType.toJson()),
              )
              .replaceAll('{package_name}', Uri.encodeComponent(packageName))
              .replaceAll('{package_version_id}', '$packageVersionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Restore a package version for the authenticated user
  /// Restores a package version owned by the authenticated user.
  ///
  /// You can restore a deleted package version under the following
  /// conditions:
  ///   - The package was deleted within the last 30 days.
  /// - The same package namespace and version is still available and not
  /// reused for a new package. If the same package namespace is not
  /// available, you will not be able to restore your package. In this
  /// scenario, to restore the deleted package, you must delete the new
  /// package that uses the deleted package's namespace first.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `write:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> restorePackageVersionForAuthenticatedUser(
    PackageTypeParam packageType,
    String packageName,
    int packageVersionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/user/packages/{package_type}/{package_name}/versions/{package_version_id}/restore'
              .replaceAll(
                '{package_type}',
                Uri.encodeComponent(packageType.toJson()),
              )
              .replaceAll('{package_name}', Uri.encodeComponent(packageName))
              .replaceAll('{package_version_id}', '$packageVersionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get list of conflicting packages during Docker migration for user
  /// Lists all packages that are in a specific user's namespace, that the
  /// requesting user has access to, and that encountered a conflict during
  /// Docker migration.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint.
  Future<List<Package>> listDockerMigrationConflictingPackagesForUser(
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/docker/conflicts'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Package>((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List packages for a user
  /// Lists all packages in a user's namespace for which the requesting user
  /// has access.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<List<Package>> listPackagesForUser(
    PackagesListPackagesForUserParameter0 packageType,
    String username, {
    PackageVisibilityParam? visibility,
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/packages'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        'package_type': [packageType.toJson()],
        if (visibility != null) 'visibility': [visibility.toJson()],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Package>((e) => Package.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a package for a user
  /// Gets a specific package metadata for a public package owned by a user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<Package> getPackageForUser(
    PackageTypeParam packageType,
    String packageName,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/packages/{package_type}/{package_name}'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Package.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a package for a user
  /// Deletes an entire package for a user. You cannot delete a public package
  /// if any version of the package has more than 5,000 downloads. In this
  /// scenario, contact GitHub support for further assistance.
  ///
  /// If the `package_type` belongs to a GitHub Packages registry that
  /// supports granular permissions, the authenticated user must have admin
  /// permissions to the package. For the list of these registries, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `delete:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> deletePackageForUser(
    PackageTypeParam packageType,
    String packageName,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/users/{username}/packages/{package_type}/{package_name}'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Restore a package for a user
  /// Restores an entire package for a user.
  ///
  /// You can restore a deleted package under the following conditions:
  ///   - The package was deleted within the last 30 days.
  /// - The same package namespace and version is still available and not
  /// reused for a new package. If the same package namespace is not
  /// available, you will not be able to restore your package. In this
  /// scenario, to restore the deleted package, you must delete the new
  /// package that uses the deleted package's namespace first.
  ///
  /// If the `package_type` belongs to a GitHub Packages registry that
  /// supports granular permissions, the authenticated user must have admin
  /// permissions to the package. For the list of these registries, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `write:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> restorePackageForUser(
    PackageTypeParam packageType,
    String packageName,
    String username, {
    String? token,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/users/{username}/packages/{package_type}/{package_name}/restore'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName))
          .replaceAll('{username}', Uri.encodeComponent(username)),
      queryParameters: {
        if (token != null) 'token': [token],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List package versions for a package owned by a user
  /// Lists package versions for a public package owned by a specified user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<List<PackageVersion>> getAllPackageVersionsForPackageOwnedByUser(
    PackageTypeParam packageType,
    String packageName,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/packages/{package_type}/{package_name}/versions'
          .replaceAll(
            '{package_type}',
            Uri.encodeComponent(packageType.toJson()),
          )
          .replaceAll('{package_name}', Uri.encodeComponent(packageName))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<PackageVersion>(
            (e) => PackageVersion.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a package version for a user
  /// Gets a specific package version for a public package owned by a
  /// specified user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` scope to use this endpoint. For more information, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<PackageVersion> getPackageVersionForUser(
    PackageTypeParam packageType,
    String packageName,
    int packageVersionId,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}'
              .replaceAll(
                '{package_type}',
                Uri.encodeComponent(packageType.toJson()),
              )
              .replaceAll('{package_name}', Uri.encodeComponent(packageName))
              .replaceAll('{package_version_id}', '$packageVersionId')
              .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PackageVersion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete package version for a user
  /// Deletes a specific package version for a user. If the package is public
  /// and the package version has more than 5,000 downloads, you cannot delete
  /// the package version. In this scenario, contact GitHub support for
  /// further assistance.
  ///
  /// If the `package_type` belongs to a GitHub Packages registry that
  /// supports granular permissions, the authenticated user must have admin
  /// permissions to the package. For the list of these registries, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `delete:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> deletePackageVersionForUser(
    PackageTypeParam packageType,
    String packageName,
    String username,
    int packageVersionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}'
              .replaceAll(
                '{package_type}',
                Uri.encodeComponent(packageType.toJson()),
              )
              .replaceAll('{package_name}', Uri.encodeComponent(packageName))
              .replaceAll('{username}', Uri.encodeComponent(username))
              .replaceAll('{package_version_id}', '$packageVersionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Restore package version for a user
  /// Restores a specific package version for a user.
  ///
  /// You can restore a deleted package under the following conditions:
  ///   - The package was deleted within the last 30 days.
  /// - The same package namespace and version is still available and not
  /// reused for a new package. If the same package namespace is not
  /// available, you will not be able to restore your package. In this
  /// scenario, to restore the deleted package, you must delete the new
  /// package that uses the deleted package's namespace first.
  ///
  /// If the `package_type` belongs to a GitHub Packages registry that
  /// supports granular permissions, the authenticated user must have admin
  /// permissions to the package. For the list of these registries, see
  /// "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:packages` and `write:packages` scopes to use this endpoint. For
  /// more information, see "[About permissions for GitHub
  /// Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages)."
  Future<void> restorePackageVersionForUser(
    PackageTypeParam packageType,
    String packageName,
    String username,
    int packageVersionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore'
              .replaceAll(
                '{package_type}',
                Uri.encodeComponent(packageType.toJson()),
              )
              .replaceAll('{package_name}', Uri.encodeComponent(packageName))
              .replaceAll('{username}', Uri.encodeComponent(username))
              .replaceAll('{package_version_id}', '$packageVersionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
