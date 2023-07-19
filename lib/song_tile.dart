import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  final int id;
  final String title;
  final Function play;
  const SongTile(
      {super.key, required this.title, required this.play, required this.id});

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<Songs>(context);
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.005),
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
                : Colors.blueAccent.shade100,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 5, color: Colors.white12),
              borderRadius: BorderRadius.circular(15),
            ),
            onTap: () {
              play();
            }),
      ),
    );
  }
}
