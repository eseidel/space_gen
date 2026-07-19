import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:petstore/api_client.dart';
import 'package:petstore/api_exception.dart';
import 'package:petstore/messages/api_response.dart';
import 'package:petstore/models/find_pets_by_status_parameter0.dart';
import 'package:petstore/models/pet.dart';

/// Everything about your Pets
class PetApi {
  PetApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Add a new pet to the store.
  /// Add a new pet to the store.
  Future<Pet> addPet(Pet pet) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/pet',
      body: pet.toJson(),
      authRequest: const HttpAuth(
        scheme: 'bearer',
        secretName: 'petstore_auth',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Pet.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update an existing pet.
  /// Update an existing pet by Id.
  Future<Pet> updatePet(Pet pet) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/pet',
      body: pet.toJson(),
      authRequest: const HttpAuth(
        scheme: 'bearer',
        secretName: 'petstore_auth',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Pet.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Finds Pets by status.
  /// Multiple status values can be provided with comma separated strings.
  Future<List<Pet>> findPetsByStatus({
    FindPetsByStatusParameter0? status = FindPetsByStatusParameter0.available,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/pet/findByStatus',
      queryParameters: {
        if (status != null) 'status': [status.toJson()],
      },
      authRequest: const HttpAuth(
        scheme: 'bearer',
        secretName: 'petstore_auth',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Pet>((e) => Pet.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Finds Pets by tags.
  /// Multiple tags can be provided with comma separated strings. Use tag1,
  /// tag2, tag3 for testing.
  Future<List<Pet>> findPetsByTags({List<String>? tags}) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/pet/findByTags',
      queryParameters: {if (tags != null) 'tags': tags},
      authRequest: const HttpAuth(
        scheme: 'bearer',
        secretName: 'petstore_auth',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Pet>((e) => Pet.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Find pet by ID.
  /// Returns a single pet.
  Future<Pet> getPetById(int petId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/pet/{petId}'.replaceAll('{petId}', '$petId'),
      authRequest: const OneOfAuth([
        ApiKeyAuth(
          name: 'api_key',
          secretName: 'api_key',
          sendIn: ApiKeyLocation.header,
        ),
        HttpAuth(scheme: 'bearer', secretName: 'petstore_auth'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Pet.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Updates a pet in the store with form data.
  /// Updates a pet resource based on the form data.
  Future<Pet> updatePetWithForm(
    int petId, {
    String? name,
    String? status,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/pet/{petId}'.replaceAll('{petId}', '$petId'),
      queryParameters: {
        if (name != null) 'name': [name],
        if (status != null) 'status': [status],
      },
      authRequest: const HttpAuth(
        scheme: 'bearer',
        secretName: 'petstore_auth',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Pet.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Deletes a pet.
  /// Delete a pet.
  Future<void> deletePet(int petId, {String? apiKey}) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/pet/{petId}'.replaceAll('{petId}', '$petId'),
      headerParameters: {'api_key': ?apiKey},
      authRequest: const HttpAuth(
        scheme: 'bearer',
        secretName: 'petstore_auth',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Uploads an image.
  /// Upload image of the pet.
  Future<ApiResponse> uploadFile(
    int petId, {
    String? additionalMetadata,
    Uint8List? uint8List,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/pet/{petId}/uploadImage'.replaceAll('{petId}', '$petId'),
      queryParameters: {
        if (additionalMetadata != null)
          'additionalMetadata': [additionalMetadata],
      },
      body: uint8List,
      bodyContentType: BodyContentType.octetStream,
      authRequest: const HttpAuth(
        scheme: 'bearer',
        secretName: 'petstore_auth',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
