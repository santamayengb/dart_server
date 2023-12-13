import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_server/sql_client/sql.client.dart';

Object onRequest(RequestContext context) {
  switch (context.request.method) {
    case HttpMethod.get:
      return handleGetRequest(context);
    case HttpMethod.post:
      return handlePostRequest(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> handleGetRequest(RequestContext context) async {
  final student = context.read<FrogMysqlClient>();
  final result = await student.execute('SELECT * FROM student;');

  final data = <Map<String, dynamic>>[];

  for (final element in result.rows) {
    data.add(element.assoc());
  }

  return Response.json(body: data);
}

Future<Response> handlePostRequest(RequestContext context) async {
  final formData = await context.request.formData();
  if (!formData.containsKey('name') && !formData.containsKey('age')) {
    Response(
      statusCode: 400,
      body: 'Missing name and age parameters ',
    );
  } else if (!formData.containsKey('name')) {
    return Response(
      statusCode: 400,
      body: 'Missing name parameters ',
    );
  } else if (!formData.containsKey('age')) {
    return Response(
      statusCode: 400,
      body: 'Missing age parameters',
    );
  }
  return Response.json(body: {'form_data': formData.fields});
}
