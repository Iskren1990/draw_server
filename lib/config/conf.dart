import 'package:envify/envify.dart';

part 'conf.g.dart';

@Envify()
abstract class Env {
  static const int port = _Env.port;
  static const String mongoUrl = _Env.mongoUrl;
  static const String superSecretKey = _Env.superSecretKey;
}