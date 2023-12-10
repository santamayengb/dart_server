// ignore_for_file: avoid_print

import 'package:dart_frog/dart_frog.dart';

import 'package:dart_server/sql_client/sql.client.dart';

Future<Response> onRequest(RequestContext context) async {
  final student = context.read<FrogMysqlClient>();
  final result = await student.execute('SELECT * FROM student;');

  final data = <Map<String, dynamic>>[];

  for (final element in result.rows) {
    data.add(element.assoc());
  }

  return Response.json(body: data);
}
