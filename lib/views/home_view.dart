import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheet_music/views/file_drop.dart';

import '../bloc/music_library/musiclibrary_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            const Center(child: FileDrop()),
            BlocBuilder<MusiclibraryBloc, MusiclibraryState>(
              builder: (context, state) {
                return Column(
                    children: state.library.map((e) => Text(e.title)).toList());
              },
            )
          ],
        ),
      ),
    );
  }
}
