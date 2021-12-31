import 'package:flutter/material.dart';
import 'package:sheet_music/views/home_view.dart';

class ReaderApp extends StatelessWidget {
  const ReaderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
