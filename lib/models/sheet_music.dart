import 'dart:io';

import 'package:path/path.dart';

class SheetMusic {
  final String title;
  final String composer;
  final File file;
  final bool favorite;
  SheetMusic({
    required this.title,
    required this.composer,
    required this.file,
    required this.favorite,
  });

  factory SheetMusic.fromFile(File file) {
    return SheetMusic(
        title: basename(file.path),
        composer: "unknown",
        file: file,
        favorite: false);
  }

  SheetMusic copyWith({
    String? title,
    String? composer,
    File? file,
    bool? favorite,
  }) {
    return SheetMusic(
      title: title ?? this.title,
      composer: composer ?? this.composer,
      file: file ?? this.file,
      favorite: favorite ?? this.favorite,
    );
  }
}
