import 'dart:convert';

class DrawModel {
  // ignore: unused_field
  int _id;
  String ownerId;
  String title;
  List<dynamic> draw;

  DrawModel(String payload) {
    formatDatFromRequest(payload);
  }

  void formatDatFromRequest(String payload) {
    
    final drawData = json.decode(payload);

    _id = drawData['_id'];
    ownerId = drawData['ownerId'];
    title = drawData['title'];
    draw = json.decode(drawData['draw']);
    if (title == null || draw.runtimeType == null) throw Exception('Title and draw are required');
  }

  static dynamic formatDataForResponse(Map<String, dynamic> drawData) {
    return {
      '_id': drawData['_id'],
      'ownerId': drawData['ownerId'],
      'title': drawData['title'],
      'draw': drawData['draw'],
    };
  }
}
