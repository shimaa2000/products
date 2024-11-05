import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvReader {
  String _baseurl = '';

  get baseurl {
    _baseurl = dotenv.maybeGet('base_url') ?? 'No base url found';
    return _baseurl;
  }

  set baseurl(value) {
    _baseurl = value;
    dotenv.env['base_url'] = '$value/api';
  }

  static String get defaultImage => dotenv.get("default_image");
}
