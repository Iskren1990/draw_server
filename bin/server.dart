import 'package:server/middleware/auth.dart';
import 'package:server/server.dart';

void main(List<String> arguments) async {
  
  final db = await Db.create(Env.mongoUrl);

  final app = Router();

  app.mount('/api/user/', User(db).router);
  app.mount('/api/draw/', Drawing().router);
  app.mount('/', Static('public').router);

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(handleCors())
      .addMiddleware(handleAuth())
      .addHandler(app);

  await db
      .open(secure: true)
      .then((value) => print('Connected to database'))
      .catchError(print);

  await serve(handler, 'localhost', Env.port)
      .then((value) => print('Server is running on port ${Env.port}'))
      .catchError(print);
}
