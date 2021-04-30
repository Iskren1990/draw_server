import 'package:server/server.dart';

int PORT = 3000;

void main(List<String> arguments) async {

  final db = await Db.create(r'mongodb+srv://draw:draw@cluster0.4dqi4.mongodb.net/draw?retryWrites=true&w=majority');

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

  await db
      .open(secure: true)
      .then((value) => print('Connected to database'))
      .catchError(print);

  await serve(hendler, 'localhost', Env.port)
      .then((value) => print('Server is running on port $PORT'))
      .catchError(print);
}
