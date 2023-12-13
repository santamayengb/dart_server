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
  // Assuming you want to create a new student record with data from the request
  // final student = context.read<FrogMysqlClient>();

  // Retrieve data from the request, adapt this part based on your needs
  final formData = await context.request.formData();
  if (!formData.containsKey('name') || !formData.containsKey('age')) {
    return Response(
      statusCode: 400,
      body: 'Missing parameters',
    );
  }
  return Response.json(body: {'form_data': formData.fields});
}
