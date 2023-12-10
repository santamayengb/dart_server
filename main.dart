import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_server/sql_client/sql.client.dart';

final mysqlClient = FrogMysqlClient();

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  print('Main methos is run');
  return serve(handler.use(databaseHandler()), ip, port);
}

Middleware databaseHandler() {
  return (handler) {
    return handler.use(
      provider<FrogMysqlClient>(
        (context) => mysqlClient,
      ),
    );
  };
}
