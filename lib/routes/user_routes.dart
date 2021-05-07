import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:server/server.dart';

class User {
  Router get router {
    final router = Router();

    router.get('/logout', (Request req) => UserController().logout(req));
    router.post('/login', (Request req) => UserController().login(req));
    router.post('/register', (Request req) =>  UserController().register(req));

    return router;
  }
}
