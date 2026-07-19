// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:backstage/api_client.dart';
import 'package:backstage/api_exception.dart';
import 'package:backstage/messages/entities_batch_response.dart';
import 'package:backstage/messages/entities_query_response.dart';
import 'package:backstage/messages/entity_ancestry_response.dart';
import 'package:backstage/messages/entity_facets_response.dart';
import 'package:backstage/messages/get_entities_by_refs_request.dart';
import 'package:backstage/messages/query_entities_by_predicate_request.dart';
import 'package:backstage/messages/query_entity_facets_by_predicate_request.dart';
import 'package:backstage/messages/refresh_entity_request.dart';
import 'package:backstage/messages/validate_entity_request.dart';
import 'package:backstage/models/entity.dart';
import 'package:backstage/models/error.dart';
import 'package:backstage/models/total_items_param.dart';

/// Endpoints with tag Entity
class EntityApi {
  EntityApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Refresh the entity related to entityRef.
  Future<void> refreshEntity(RefreshEntityRequest refreshEntityRequest) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/refresh',
      body: refreshEntityRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }
  }

  /// Get all entities matching a given filter.
  /// [fields] example:
  /// ```json
  /// [
  ///   "metadata.name",
  ///   "relations"
  /// ]
  /// ```
  /// [fields] example:
  /// ```json
  /// [
  ///   "kind",
  ///   "metadata.name",
  ///   "metadata.namespace"
  /// ]
  /// ```
  /// [filter] example:
  /// ```json
  /// [
  ///   "kind=group"
  /// ]
  /// ```
  /// [filter] example:
  /// ```json
  /// [
  ///   "kind=component,metadata.annotations.backstage.io/orphan=true"
  /// ]
  /// ```
  Future<List<Entity>> getEntities({
    List<String>? fields,
    int? limit,
    List<String>? filter,
    int? offset,
    String? after,
    List<String>? order,
  }) async {
    limit?.validateMinimum(0);
    offset?.validateMinimum(0);
    after?.validateMinimumLength(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/entities',
      queryParameters: {
        if (fields != null) 'fields': [fields.join(',')],
        if (limit != null) 'limit': [limit.toString()],
        if (filter != null) 'filter': filter,
        if (offset != null) 'offset': [offset.toString()],
        if (after != null) 'after': [after],
        if (order != null) 'order': order,
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Entity>((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a single entity by the UID.
  Future<Entity> getEntityByUid(String uid) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/entities/by-uid/{uid}'.replaceAll(
        '{uid}',
        Uri.encodeComponent(uid),
      ),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return Entity.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a single entity by UID.
  Future<void> deleteEntityByUid(String uid) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/entities/by-uid/{uid}'.replaceAll(
        '{uid}',
        Uri.encodeComponent(uid),
      ),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }
  }

  /// Get an entity by an entity ref.
  Future<Entity> getEntityByName(
    String kind,
    String namespace,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/entities/by-name/{kind}/{namespace}/{name}'
          .replaceAll('{kind}', Uri.encodeComponent(kind))
          .replaceAll('{namespace}', Uri.encodeComponent(namespace))
          .replaceAll('{name}', Uri.encodeComponent(name)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return Entity.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an entity's ancestry by entity ref.
  Future<EntityAncestryResponse> getEntityAncestryByName(
    String kind,
    String namespace,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/entities/by-name/{kind}/{namespace}/{name}/ancestry'
          .replaceAll('{kind}', Uri.encodeComponent(kind))
          .replaceAll('{namespace}', Uri.encodeComponent(namespace))
          .replaceAll('{name}', Uri.encodeComponent(name)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return EntityAncestryResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a batch set of entities given an array of entityRefs.
  /// [filter] example:
  /// ```json
  /// [
  ///   "kind=group"
  /// ]
  /// ```
  /// [filter] example:
  /// ```json
  /// [
  ///   "kind=component,metadata.annotations.backstage.io/orphan=true"
  /// ]
  /// ```
  Future<EntitiesBatchResponse> getEntitiesByRefs({
    List<String>? filter,
    GetEntitiesByRefsRequest? getEntitiesByRefsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/entities/by-refs',
      queryParameters: {if (filter != null) 'filter': filter},
      body: getEntitiesByRefsRequest?.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return EntitiesBatchResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Search for entities by a given query.
  /// [fields] example:
  /// ```json
  /// [
  ///   "metadata.name",
  ///   "relations"
  /// ]
  /// ```
  /// [fields] example:
  /// ```json
  /// [
  ///   "kind",
  ///   "metadata.name",
  ///   "metadata.namespace"
  /// ]
  /// ```
  /// [orderField] example:
  /// ```json
  /// [
  ///   "metadata.name,asc"
  /// ]
  /// ```
  /// [orderField] example:
  /// ```json
  /// [
  ///   "spec.owner,desc"
  /// ]
  /// ```
  /// [filter] example:
  /// ```json
  /// [
  ///   "kind=group"
  /// ]
  /// ```
  /// [filter] example:
  /// ```json
  /// [
  ///   "kind=component,metadata.annotations.backstage.io/orphan=true"
  /// ]
  /// ```
  Future<EntitiesQueryResponse> getEntitiesByQuery({
    List<String>? fields,
    int? limit,
    int? offset,
    List<String>? orderField,
    String? cursor,
    List<String>? filter,
    TotalItemsParam? totalItems,
    String? fullTextFilterTerm,
    List<String>? fullTextFilterFields,
  }) async {
    limit?.validateMinimum(0);
    offset?.validateMinimum(0);
    cursor?.validateMinimumLength(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/entities/by-query',
      queryParameters: {
        if (fields != null) 'fields': [fields.join(',')],
        if (limit != null) 'limit': [limit.toString()],
        if (offset != null) 'offset': [offset.toString()],
        if (orderField != null) 'orderField': orderField,
        if (cursor != null) 'cursor': [cursor],
        if (filter != null) 'filter': filter,
        if (totalItems != null) 'totalItems': [totalItems.toJson()],
        if (fullTextFilterTerm != null)
          'fullTextFilterTerm': [fullTextFilterTerm],
        if (fullTextFilterFields != null)
          'fullTextFilterFields': [fullTextFilterFields.join(',')],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return EntitiesQueryResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Query entities using predicate-based filters.
  Future<EntitiesQueryResponse> queryEntitiesByPredicate({
    QueryEntitiesByPredicateRequest? queryEntitiesByPredicateRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/entities/by-query',
      body: queryEntitiesByPredicateRequest?.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return EntitiesQueryResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get all entity facets that match the given filters.
  /// [facet] example:
  /// ```json
  /// [
  ///   "kind"
  /// ]
  /// ```
  /// [facet] example:
  /// ```json
  /// [
  ///   "spec.type"
  /// ]
  /// ```
  /// [filter] example:
  /// ```json
  /// [
  ///   "kind=group"
  /// ]
  /// ```
  /// [filter] example:
  /// ```json
  /// [
  ///   "kind=component,metadata.annotations.backstage.io/orphan=true"
  /// ]
  /// ```
  Future<EntityFacetsResponse> getEntityFacets(
    List<String> facet, {
    List<String>? filter,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/entity-facets',
      queryParameters: {'facet': facet, if (filter != null) 'filter': filter},
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return EntityFacetsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get entity facets using predicate-based filters.
  Future<EntityFacetsResponse> queryEntityFacetsByPredicate(
    QueryEntityFacetsByPredicateRequest queryEntityFacetsByPredicateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/entity-facets',
      body: queryEntityFacetsByPredicateRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return EntityFacetsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Validate that a passed in entity has no errors in schema.
  Future<void> validateEntity(
    ValidateEntityRequest validateEntityRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/validate-entity',
      body: validateEntityRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
