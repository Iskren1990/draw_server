import 'package:server/server.dart';

class AppRouter {
  Handler get router {
    final app = Router();

    app.mount('/api/user/', User().router);
    app.mount('/api/draw/', Drawing().router);
    app.mount('/', Static('public').router);

    return Pipeline()
        .addMiddleware(logRequests())
        .addMiddleware(handleCors())
        .addMiddleware(handleAuth())
        .addHandler(app);
  }
}

