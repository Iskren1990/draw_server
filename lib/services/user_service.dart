import 'package:server/server.dart';

class UserService {

  static DbCollection userCollection;
  
  UserService(Db dbservice) {
        userCollection = dbservice.collection('users');
  }

  static Future<Map<String, dynamic>> checkUserExistance(UserModel user) {
    return userCollection.findOne(where.eq('username', user.username));
  }

  static Future<WriteResult> createUser(UserModel user) {
    return userCollection.insertOne({'username': user.username, 'password': user.hashedPass});
  }
}
