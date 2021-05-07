import 'package:server/server.dart';
import 'dart:convert';

class UserModel {
  int id;
  String username;
  String hashedPass;
  String plainPass;
  List<DrawModel> draws; // Map<Draws>

  UserModel(String payload) {
    formatDatFromRequest(payload);
  }

  void formatDatFromRequest(String payload) {
    final Map<String, dynamic> userInfo = json.decode(payload);
    validate(userInfo);

    username = userInfo['username'];
    plainPass = userInfo['password'];
    hashedPass = _hashPassword(plainPass);
  }

  static Object formatDataForResponse(Map<String, Object> userInfo) {
    
    final token = generateJWT({
        '_id': userInfo['_id'],
        'username': userInfo['username'],
        'draws': userInfo['draws'] ?? []
      }.toString());
      
    return {
      '_id': userInfo['_id'],
      'username': userInfo['username'],
      'draws': userInfo['draws'] ?? [],
      'token': 'Bearer $token',
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
