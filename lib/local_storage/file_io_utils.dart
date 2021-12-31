import 'dart:io';

import 'package:path/path.dart';

List<File> getPdfFilesInDirectory(String directoryPath) {
  final dir = Directory.fromUri(Uri(path: directoryPath));
  final allFiles = dir.listSync(recursive: true).whereType<File>().toList();
  return allFiles
      .where((element) => extension(element.path).toLowerCase() == ".pdf")
      .toList();
}
