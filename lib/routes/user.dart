
// import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../server.dart';

class User {

    final Db dbService;
    
    User(this.dbService);

  Router get router {
    final router = Router();
    final dbService = this.dbService;

    router.post('/register', (Request req) =>  register(req, dbService));

    router.post('/login', (Request req) => login(req, dbService));
    
    router.get('/logout', (Request req) => logout(req));

    return router;
  }
}
