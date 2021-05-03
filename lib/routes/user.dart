import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:server/server.dart';

class User {
  Router get router {
    final router = Router();

    router.post('/register', (Request req) =>  UserControler().register(req));

    router.post('/login', (Request req) => UserControler().login(req));
    
    router.get('/logout', (Request req) => UserControler().logout(req));

    return router;
  }
}
