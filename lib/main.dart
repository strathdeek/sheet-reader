import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheet_music/app.dart';
import 'package:sheet_music/bloc/music_library/musiclibrary_bloc.dart';

void main() {
  final musicLibraryBloc = MusiclibraryBloc();
  runApp(BlocProvider(
    create: (context) => musicLibraryBloc,
    child: const ReaderApp(),
  ));
}
