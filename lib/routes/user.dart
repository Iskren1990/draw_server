import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class User {
  Router get router {
    final router = Router();

    router.post('/register', (Request req) => Response.ok('Post Register Router Handler'));
    router.post('/login', (Request req) => Response.ok('Post Login Router Handler'));
    router.get('/logout', (Request req) => Response.ok('Get Logout Router Handler'));

    return router;
  }
}