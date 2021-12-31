part of 'musiclibrary_bloc.dart';

@immutable
class MusiclibraryState {
  final List<SheetMusic> library;
  final List<String> directories;

  const MusiclibraryState({
    required this.library,
    required this.directories,
  });

  MusiclibraryState copyWith({
    List<SheetMusic>? library,
    List<String>? directories,
  }) {
    return MusiclibraryState(
      library: library ?? this.library,
      directories: directories ?? this.directories,
    );
  }
}

const initialLibrary = MusiclibraryState(library: [], directories: []);
