import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Drawing {
  Router get router {
    final router = Router();

    router.post('/create', (Request req) => Response.ok('Post Create Router Handler'));
    // router.get('/view-all', (Request req) => Response.ok('Get Logout Router Handler'));
    router.get('/view', (Request req) => Response.ok('Get View One Router Handler'));
    router.delete('/delete', (Request req) => Response.ok('Delete One Router Handler'));

    return router;
  }
}