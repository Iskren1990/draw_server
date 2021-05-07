import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../server.dart';

class Drawing {
  Handler get router {
    final router = Router();

    router.get('/user/<id>', (Request req, String id) => DrawsController().getUserDrws(id));
    router.get('/view/<id>', (Request req, String id) => DrawsController().getChosenDraw(id));
    router.post('/create', (Request req) => DrawsController().create(req));
    router.delete('/delete/<id>', (Request req, String id) => DrawsController().deleteChosenDraw(id));

    final handler = Pipeline().addMiddleware(checkAuthorisation()).addHandler(router);
    
    return handler;
  }
}