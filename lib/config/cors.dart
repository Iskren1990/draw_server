import 'package:shelf/shelf.dart';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
  'Access-Control-Allow-Headers': 'Origin, Content-Type',
};

Middleware handleCors() {
  return createMiddleware(requestHandler: (Request req) {
    return Response.ok('', headers: corsHeaders);
  });
}
