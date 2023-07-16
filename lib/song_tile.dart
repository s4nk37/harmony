import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'song.dart';

class SongTile extends StatelessWidget {
  final int id;
  final String title;
  final Function play;
  const SongTile(
      {super.key, required this.title, required this.play, required this.id});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Songs>(context);

    return Container(
      width: double.infinity,
      // height: 70,
      // color: Colors.indigo.shade200,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Center(
        child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  color: id.isEven
                      ? Colors.white.withOpacity(0.8)
                      : Colors.black.withOpacity(0.8)),
            ),
            tileColor: id.isEven
                ? Colors.indigoAccent.shade200
                : Colors.amberAccent.shade200,
            shape: RoundedRectangleBorder(
              // side: BorderSide(width: 0, color: Colors.black12),
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: () {
              play();
            }),
      ),
    );
  }
}
