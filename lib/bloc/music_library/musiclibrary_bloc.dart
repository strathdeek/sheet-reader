import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sheet_music/local_storage/file_io_utils.dart';
import 'package:sheet_music/models/sheet_music.dart';

part 'musiclibrary_event.dart';
part 'musiclibrary_state.dart';

class MusiclibraryBloc extends Bloc<MusiclibraryEvent, MusiclibraryState> {
  MusiclibraryBloc() : super(initialLibrary) {
    on<ApplicationStarted>((event, emit) {
      add(MusicLibraryRefreshed());
    });
    on<MusicLibraryRefreshed>((event, emit) {
      final sheetMusic = getSheetMusicFromDirectories(state.directories);
      emit(state.copyWith(library: sheetMusic));
    });
    on<DirectoryAdded>((event, emit) {
      var dirList = <String>[];
      dirList.addAll(state.directories);
      dirList.add(event.directoryPath);
      emit(state.copyWith(directories: dirList));
      add(MusicLibraryRefreshed());
    });
    on<DirectoryRemoved>((event, emit) {
      final dirList = state.directories;
      dirList.removeWhere((dir) => dir == event.directoryPath);
      emit(state.copyWith(directories: dirList));
      add(MusicLibraryRefreshed());
    });
  }
}

List<SheetMusic> getSheetMusicFromDirectories(List<String> directories) {
  final List<File> files = [];

  for (var dir in directories) {
    files.addAll(getPdfFilesInDirectory(dir));
  }

  return files.map((e) => SheetMusic.fromFile(e)).toList();
}
