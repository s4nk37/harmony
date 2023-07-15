import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  const SongTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.yellow.shade200,
      height: 75,
      child: Center(
        child: ListTile(
          title: const Text("Something just like this"),
          subtitle: const Text("The Chainsmokers & coldplay"),
          onTap: () {},
        ),
      ),
    );
  }
}
