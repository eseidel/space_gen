import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:multipart/api_client.dart';
import 'package:multipart/api_exception.dart';
import 'package:multipart/model/upload_mixed_request.dart';
import 'package:multipart/model/upload_multi_file_request.dart';
import 'package:multipart/model/upload_optional_request.dart';
import 'package:multipart/model/upload_plain_request.dart';
import 'package:multipart/model/upload_rich_scalars_request.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Upload a file as the whole request body.
  Future<void> uploadPlain(
    UploadPlainRequest uploadPlainRequest,
  ) async {
    final multipartFields = <String, String>{};
    final multipartFiles = <http.MultipartFile>[
      http.MultipartFile.fromBytes(
        'file',
        uploadPlainRequest.file,
        filename: 'file',
      ),
    ];
    final response = await client.invokeApiMultipart(
      method: Method.post,
      path: '/upload/plain',
      fields: multipartFields,
      files: multipartFiles,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }

  /// Upload a file with metadata.
  Future<void> uploadMixed(
    UploadMixedRequest uploadMixedRequest,
  ) async {
    final multipartFields = <String, String>{
      'name': uploadMixedRequest.name,
    };
    final multipartFiles = <http.MultipartFile>[
      http.MultipartFile.fromBytes(
        'file',
        uploadMixedRequest.file,
        filename: 'file',
      ),
    ];
    {
      final v = uploadMixedRequest.description;
      if (v != null) multipartFields['description'] = v;
    }
    {
      final v = uploadMixedRequest.size;
      if (v != null) multipartFields['size'] = v.toString();
    }
    final response = await client.invokeApiMultipart(
      method: Method.post,
      path: '/upload/mixed',
      fields: multipartFields,
      files: multipartFiles,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }

  /// Endpoint whose multipart body itself is optional.
  Future<void> uploadOptional({
    UploadOptionalRequest? uploadOptionalRequest,
  }) async {
    final multipartFields = <String, String>{};
    final multipartFiles = <http.MultipartFile>[];
    if (uploadOptionalRequest != null) {
      {
        final v = uploadOptionalRequest.note;
        if (v != null) multipartFields['note'] = v;
      }
      multipartFiles.add(
        http.MultipartFile.fromBytes(
          'file',
          uploadOptionalRequest.file,
          filename: 'file',
        ),
      );
    }
    final response = await client.invokeApiMultipart(
      method: Method.post,
      path: '/upload/optional',
      fields: multipartFields,
      files: multipartFiles,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }

  /// Upload with enum + date-time scalar fields.
  Future<void> uploadRichScalars(
    UploadRichScalarsRequest uploadRichScalarsRequest,
  ) async {
    final multipartFields = <String, String>{
      'visibility': uploadRichScalarsRequest.visibility.toJson(),
      'capturedAt': uploadRichScalarsRequest.capturedAt.toIso8601String(),
    };
    final multipartFiles = <http.MultipartFile>[
      http.MultipartFile.fromBytes(
        'file',
        uploadRichScalarsRequest.file,
        filename: 'file',
      ),
    ];
    {
      final v = uploadRichScalarsRequest.tag;
      if (v != null) multipartFields['tag'] = v;
    }
    final response = await client.invokeApiMultipart(
      method: Method.post,
      path: '/upload/rich-scalars',
      fields: multipartFields,
      files: multipartFiles,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }

  /// Upload with one required + one optional file.
  Future<void> uploadMultiFile(
    UploadMultiFileRequest uploadMultiFileRequest,
  ) async {
    final multipartFields = <String, String>{};
    final multipartFiles = <http.MultipartFile>[
      http.MultipartFile.fromBytes(
        'primary',
        uploadMultiFileRequest.primary,
        filename: 'primary',
      ),
    ];
    {
      final f = uploadMultiFileRequest.thumbnail;
      if (f != null) {
        multipartFiles.add(
          http.MultipartFile.fromBytes('thumbnail', f, filename: 'thumbnail'),
        );
      }
    }
    final response = await client.invokeApiMultipart(
      method: Method.post,
      path: '/upload/multi-file',
      fields: multipartFields,
      files: multipartFiles,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }
}
