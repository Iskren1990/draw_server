import 'package:server/server.dart';
import 'dart:convert';

class UserModel {
  int id;
  String username;
  String hashedPass;
  String plainPass;
  List<DrawModel> draws; // Map<Draws>

  UserModel(String payload) {
    payload = formatDatFromRequest(payload);
  }

  dynamic formatDatFromRequest(String payload) {
    final Map<String, dynamic> userInfo = json.decode(payload);
    validate(userInfo);
    
    username = userInfo['username'];
    plainPass = userInfo['password'];
    hashedPass = _hashPassword(plainPass);
  }

  static Object formatDataForResponse(Map<String, Object> userInfo) {
    return {
      '_id': userInfo['_id'],
      'username': userInfo['username'],
      'draws': userInfo['draws'] ?? []
    };
  }

  void validate(Map<String, dynamic> userInfo) {
    if (userInfo['username'] == null || userInfo['password'] == null) {
      throw Exception('Username and password are required');
    }
  }

   String _hashPassword(String plainPassword) {
      return hashPassword(plainPassword);
  }
}
