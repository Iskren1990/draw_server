import 'package:shelf/shelf.dart';
import '../server.dart';

const secret = Env.superSecretKey;

Middleware handleAuth() {
  return (Handler innerHandler) {
    return (Request req) async {
      
      final authHeader = req.headers['authorization'];
      var token, jwt;

      if (authHeader != null && authHeader.startsWith('Bearer ')) {
        token = authHeader.substring(7);
        jwt = validateJWT(token);
      }

      final updatedRequest = req.change(context: {
        'authDetails': jwt,
      });
      return await innerHandler(updatedRequest);
    };
  };
}

Middleware checkAuthorisation() {
  return createMiddleware(
    requestHandler: (Request req) {
      if (req.context['authDetails'] == null) {
        return Response.forbidden('You need to be logged in.');
      }
      return null;
    },
  );
}