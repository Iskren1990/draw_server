import 'package:server/server.dart';

class DrawService {
  static DbCollection drawCollection;

  DrawService(Db dbservice) {
    drawCollection = dbservice.collection('draws');
  }

  static Future<WriteResult> createDraw(DrawModel draw) {
    final res = drawCollection.insertOne({'ownerId': draw.ownerId, 'title': draw.title, 'draw': draw.draw});
    return res;
  }

  static Stream<Map<String, dynamic>> getUserDraws(String id) {
    final res = drawCollection.find({'ownerId': id});
    return res;
  }

  static Future<Map<String, dynamic>> getChosenDraw(ObjectId id) {
    final res = drawCollection.findOne({'_id': id});

    return res;
  }

  static Future<WriteResult> deleteChosenDraw(ObjectId id) {
    final res = drawCollection.deleteOne({'_id': id});

    return res;
  }
}
