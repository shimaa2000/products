import 'env_reader.dart';

class MediaFileLinkGenerator {
  static String getFileLink(String fileName) {
    return '${EnvReader().baseurl.split('/api').first}/FileData/$fileName';
  }
}
