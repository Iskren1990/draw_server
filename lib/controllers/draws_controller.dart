import 'dart:async';
import 'dart:convert';
import 'package:server/server.dart';

class DrawsController {
  Future<Response> create(Request req) async {
    final payload = await req.readAsString();

    try {
      final draw = DrawModel(payload);
      final createdDraw = (await DrawService.createDraw(draw)).document;
      final clientDrawData = DrawModel.formatDataForResponse(createdDraw);

      return Response.ok(json.encode(clientDrawData),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      print(e);
      return Response(HttpStatus.badRequest, body: e.message);
    }
  }

  Future<Response> getUserDrws(String id) async {
    try {
      final userDrawsFuture = DrawService.getUserDraws(id);
      final userDraws = await userDrawsFuture.toList();
      return Response.ok(json.encode(userDraws),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      print(e);
      return Response(HttpStatus.badRequest, body: e.message);
    }
  }

  Future<Response> getChosenDraw(String id) async {
    try {
      final idAsObject = ObjectId.fromHexString(id);
      final chosenDraw = await DrawService.getChosenDraw(idAsObject);

      return Response.ok(json.encode(chosenDraw),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      print(e);
      return Response(HttpStatus.badRequest, body: e.message);
    }
  }
  
// GDPR concerns :/
    Future<Response> deleteChosenDraw(String id) async {
    try {
      final idAsObject = ObjectId.fromHexString(id);
      final deletedDraw = await DrawService.deleteChosenDraw(idAsObject);

      return Response.ok(json.encode(deletedDraw.document),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      print(e);
      return Response(HttpStatus.badRequest, body: e.message);
    }
  }
}
