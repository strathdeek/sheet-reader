part of 'musiclibrary_bloc.dart';

@immutable
abstract class MusiclibraryEvent {}

class ApplicationStarted extends MusiclibraryEvent {}

class MusicLibraryRefreshed extends MusiclibraryEvent {}

class DirectoryAdded extends MusiclibraryEvent {
  final String directoryPath;

  DirectoryAdded(this.directoryPath);
}

class DirectoryRemoved extends MusiclibraryEvent {
  final String directoryPath;

  DirectoryRemoved(this.directoryPath);
}
