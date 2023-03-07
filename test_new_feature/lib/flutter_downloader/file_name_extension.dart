import 'dart:io';
import 'package:path/path.dart' as p;

class FileNameExtension {
  static String namePlus(
    String path,
    String name, {
    String format = 'd',
    bool space = true,
  }) {
    final filePaths = _getAllCurrentFilePaths(path);

    final nameList = filePaths.map((e) => e.split('/').last).toList();

    final fileName = name.substring(0, name.lastIndexOf('.'));

    final fileType = name.substring(name.lastIndexOf('.'), name.length);

    String result = name;

    int i = 0;
    while (nameList.contains(result)) {
      i += 1;
      result = fileName +
          (space ? ' ' : '') +
          format.replaceAll('d', '$i') +
          fileType;
    }

    return p.join(path, result);
  }

  static List<String> _getAllCurrentFilePaths(String path) {
    final files = Directory(path).listSync();
    return files.map((e) => e.absolute.path).toList();
  }
}
