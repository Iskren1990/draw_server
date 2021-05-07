import 'package:server/server.dart';

void main(List<String> arguments) async {
  
  final db = await Db.create(Env.mongoUrl);
  UserService(db);
  DrawService(db);

  final handler = AppRouter().router;

  await db
      .open(secure: true)
      .then((value) => print('Connected to database'))
      .catchError(print);

  await serve(handler, 'localhost', Env.port)
      .then((value) => print('Server is running on port ${Env.port}'))
      .catchError(print);
}
