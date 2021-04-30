import 'package:server/server.dart';
import 'dart:io';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';


int PORT = 3000;

void main(List<String> arguments) async {
  final app = Router();

  app.mount('/api/user/', User().router);
  app.mount('/api/draw/', Drawing().router);

  app.get('/api/assets/<name|.*>', createStaticHandler('public'));

  app.get('/api/<name|.*>', (Request req, String name) {
    final indexHTML = File('public/index.html').readAsStringSync();
    return Response.ok(indexHTML, headers: {'Content-Type': 'text/html'});
  });

  final hendler = Pipeline()
  .addMiddleware(logRequests())
  .addMiddleware(handleCors())
  .addHandler(app);

  await io
      .serve(hendler, 'localhost', 3000)
      .then((value) => print('Server is running on port $PORT'))
      .catchError(print);
}

