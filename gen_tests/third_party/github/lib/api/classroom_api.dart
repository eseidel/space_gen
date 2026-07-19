import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/models/classroom.dart';
import 'package:github/models/classroom_accepted_assignment.dart';
import 'package:github/models/classroom_assignment.dart';
import 'package:github/models/classroom_assignment_grade.dart';
import 'package:github/models/simple_classroom.dart';
import 'package:github/models/simple_classroom_assignment.dart';

/// Interact with GitHub Classroom.
class ClassroomApi {
  ClassroomApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get an assignment
  /// Gets a GitHub Classroom assignment. Assignment will only be returned if
  /// the current user is an administrator of the GitHub Classroom for the
  /// assignment.
  Future<ClassroomAssignment> getAnAssignment(int assignmentId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/assignments/{assignment_id}'.replaceAll(
        '{assignment_id}',
        '$assignmentId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ClassroomAssignment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List accepted assignments for an assignment
  /// Lists any assignment repositories that have been created by students
  /// accepting a GitHub Classroom assignment. Accepted assignments will only
  /// be returned if the current user is an administrator of the GitHub
  /// Classroom for the assignment.
  Future<List<ClassroomAcceptedAssignment>>
  listAcceptedAssignmentsForAnAssignment(
    int assignmentId, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/assignments/{assignment_id}/accepted_assignments'.replaceAll(
        '{assignment_id}',
        '$assignmentId',
      ),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ClassroomAcceptedAssignment>(
            (e) =>
                ClassroomAcceptedAssignment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get assignment grades
  /// Gets grades for a GitHub Classroom assignment. Grades will only be
  /// returned if the current user is an administrator of the GitHub Classroom
  /// for the assignment.
  Future<List<ClassroomAssignmentGrade>> getAssignmentGrades(
    int assignmentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/assignments/{assignment_id}/grades'.replaceAll(
        '{assignment_id}',
        '$assignmentId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ClassroomAssignmentGrade>(
            (e) => ClassroomAssignmentGrade.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List classrooms
  /// Lists GitHub Classroom classrooms for the current user. Classrooms will
  /// only be returned if the current user is an administrator of one or more
  /// GitHub Classrooms.
  Future<List<SimpleClassroom>> listClassrooms({
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/classrooms',
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SimpleClassroom>(
            (e) => SimpleClassroom.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a classroom
  /// Gets a GitHub Classroom classroom for the current user. Classroom will
  /// only be returned if the current user is an administrator of the GitHub
  /// Classroom.
  Future<Classroom> getAClassroom(int classroomId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/classrooms/{classroom_id}'.replaceAll(
        '{classroom_id}',
        '$classroomId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Classroom.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List assignments for a classroom
  /// Lists GitHub Classroom assignments for a classroom. Assignments will
  /// only be returned if the current user is an administrator of the GitHub
  /// Classroom.
  Future<List<SimpleClassroomAssignment>> listAssignmentsForAClassroom(
    int classroomId, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/classrooms/{classroom_id}/assignments'.replaceAll(
        '{classroom_id}',
        '$classroomId',
      ),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SimpleClassroomAssignment>(
            (e) =>
                SimpleClassroomAssignment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
