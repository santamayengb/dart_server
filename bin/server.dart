// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../main.dart' as entrypoint;
import '../routes/index.dart' as index;
import '../routes/teacher/index.dart' as teacher_index;
import '../routes/student/index.dart' as student_index;
import '../routes/parent/index.dart' as parent_index;


void main() async {
  final address = InternetAddress.anyIPv6;
  final port = int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
  createServer(address, port);
}

Future<HttpServer> createServer(InternetAddress address, int port) async {
  final handler = Cascade().add(buildRootHandler()).handler;
  final server = await entrypoint.run(handler, address, port);
  print('\x1B[92m✓\x1B[0m Running on http://${server.address.host}:${server.port}');
  return server;
}

Handler buildRootHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..mount('/parent', (context) => buildParentHandler()(context))
    ..mount('/student', (context) => buildStudentHandler()(context))
    ..mount('/teacher', (context) => buildTeacherHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildParentHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => parent_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildStudentHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => student_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildTeacherHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => teacher_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => index.onRequest(context,));
  return pipeline.addHandler(router);
}

