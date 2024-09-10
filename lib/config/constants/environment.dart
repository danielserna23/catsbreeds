import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theCatApiKey =
      dotenv.env['THE_CATAPI_KEY'] ?? 'No ha api_key configurada';
}
