import 'package:server/server.dart';
import 'package:path/path.dart' as p;

class Static {
  final reqPath;

  Static(this.reqPath);

  Router get router {
    final router = Router();

    router.get('/api/assets/<name|.*>', (Request req) async {
      final filePath = p.join('public', req.requestedUri.path.substring(5));
      return await createFileHandler(filePath)(req);
    });

    router.all('/<name|.*>', (Request req) async {
    final indexHTML = File('public/index.html').readAsStringSync();
    return Response.ok(indexHTML, headers: {'Content-Type': 'text/html'});
    });

    return router;
  }
}
