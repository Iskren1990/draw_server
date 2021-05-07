import 'dart:async';
import 'dart:convert';
import 'package:server/server.dart';


class UserController {

  Future<Response> register(Request req) async {
    final payload = await req.readAsString();

    try {
      final user = UserModel(payload);
      final dbUserInfo = await UserService.checkUserExistance(user);

      if (dbUserInfo != null) {
        throw Exception('User with username ${user.username} already registered');
      }

      final createdUser = (await UserService.createUser(user)).document;
      final clientUserData = UserModel.formatDataForResponse(createdUser);
      return Response.ok(json.encode(clientUserData), headers: {'Content-Type': 'application/json'});

    } catch (e) {
      print(e);
      return Response(HttpStatus.badRequest, body: e.message);
    }
  }

  Future<Response> login(Request req) async {
    final payload = await req.readAsString();

    try {
      final user = UserModel(payload);
      final dbUserInfo = await UserService.checkUserExistance(user);

      if (dbUserInfo == null || false == validatePassword(user.plainPass, dbUserInfo['password'])) {
        throw Exception('No such user or invalid password');
      }
      
      final clientUserData = UserModel.formatDataForResponse(dbUserInfo);

      return Response.ok(json.encode(clientUserData), headers: {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType});

    } catch (e) {
      print(e);
      return Response(HttpStatus.badRequest, body: e.message);
    }
  }

  Response logout(Request req) {
    final token = req.headers['authentication'];

    if (token != null) {
      // blacklist the token
      return Response.ok('Logged out');
    }

    return Response.forbidden('Not Authorized');
  }
}
