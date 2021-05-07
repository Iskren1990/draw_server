import 'package:steel_crypt/steel_crypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../server.dart';

final hasher = HashCrypt(algo: HashAlgo.Blake2b);
const secretKey = Env.superSecretKey;

String hashPassword(String password) {
  return hasher.hash(inp: password);
}

bool validatePassword(String password, String hash) {
  return hasher.check(plain: password, hashed: hash);
}

String generateJWT(String subject) {
  final jwt = JWT(
    {
      'iat': DateTime.now().millisecondsSinceEpoch,
    },
    subject: subject,
  );
  return jwt.sign(SecretKey(secretKey));
}

dynamic validateJWT(String token) {
  try {
    final jwt = JWT.verify(token, SecretKey(secretKey));
    return jwt;
  } catch (e) {
    return null;
  }
}
