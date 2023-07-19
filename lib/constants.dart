import 'package:flutter/material.dart';

//Colors

final Color bgScaffold = Colors.indigo.shade100;
final Color bgAppBar = Colors.indigo.shade100;
final Color bgMusicControls = Colors.indigo.shade100.withOpacity(0.9);

//AppBar

AppBar myAppBar = AppBar(
  title: const Row(
    children: [
      Text(
        "Harmony",
        style: TextStyle(color: Colors.indigo, fontSize: 25),
      ),
      SizedBox(
        width: 10,
      ),
      Icon(
        Icons.multitrack_audio_sharp,
        color: Colors.pink,
        size: 33,
      )
    ],
  ),
  centerTitle: false,
  backgroundColor: bgAppBar,
  elevation: 0.0,
);

//Greeting function

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}
