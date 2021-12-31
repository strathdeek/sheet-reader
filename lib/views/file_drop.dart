import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheet_music/bloc/music_library/musiclibrary_bloc.dart';
import 'package:sheet_music/local_storage/file_io_utils.dart';

class FileDrop extends StatefulWidget {
  const FileDrop({Key? key}) : super(key: key);

  @override
  _FileDropState createState() => _FileDropState();
}

class _FileDropState extends State<FileDrop> {
  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) {
        for (var element in detail.files) {
          BlocProvider.of<MusiclibraryBloc>(context)
              .add(DirectoryAdded(element.path));
        }
      },
      onDragEntered: (detail) {},
      onDragExited: (detail) {},
      child: Container(
        height: 200,
        width: 200,
        color: Colors.blue.withOpacity(0.4),
      ),
    );
  }
}
