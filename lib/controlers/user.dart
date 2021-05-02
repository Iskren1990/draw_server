import 'package:server/server.dart';
import 'dart:convert';

Future<Response> register(Request req, Db dbService) async {
  final userCollection = dbService.collection('users');
  final payload = await req.readAsString();
  final Map<String, dynamic> userInfo = json.decode(payload);
  final username = userInfo['username'];
  final password = userInfo['password'];
  if (username == null || password == null) {
    return Response(HttpStatus.badRequest,
        body: 'Username and password are required');
  }

  try {
    final hashedPass = hashPassword(password);
    final dbUserInfo =
        await userCollection.findOne(where.eq('username', username));

    if (dbUserInfo == null) {
      final createdUser = (await userCollection
              .insertOne({'username': username, 'password': hashedPass}))
          .document;

      createdUser.remove('password');
      return Response.ok(json.encode(createdUser),
          headers: {'Content-Type': 'application/json'});
    }
    return Response(HttpStatus.badRequest,
        body: 'User with username $username already registered');
  } catch (e) {
    print(e);
    return Response.internalServerError(
        body: 'There was an error, please try again later.');
  }
}

Future<Response> login(Request req, Db dbService) async {
  final userCollection = dbService.collection('users');
  final payload = await req.readAsString();
  final Map<String, dynamic> userInfo = json.decode(payload);
  final username = userInfo['username'];
  final password = userInfo['password'];
  if (username == null || password == null) {
    return Response(HttpStatus.badRequest,
        body: 'Username and password are required');
  }

  try {
    final dbUserInfo =
        await userCollection.findOne(where.eq('username', username));

    if (dbUserInfo == null ||
        false == validatePassword(password, dbUserInfo['password'])) {
      return Response(HttpStatus.badRequest,
          body: 'No such user or invalid password');
    }

    dbUserInfo.remove('password');

    final token = generateJWT(dbUserInfo.toString());

    return Response.ok(json.encode(token), headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    });
  } catch (e) {
    print(e);
    return Response.internalServerError(
        body: 'There was an error, please try again later.');
  }
}

Response logout(Request req) {
  final token = req.headers['authorization'];
  if (token != null) {
    return Response.ok('Logged out');
  }
  return Response.forbidden('ddsf');
}
