import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Song {
  String title;
  String songUrl;

  Song({required this.title, required this.songUrl});
}

class Songs with ChangeNotifier {
  List<Song> _songsList = [];

  List<Song> get songsList {
    return [..._songsList];
  }

  Future<void> fetchSongs() async {
    _songsList = [];
    print("fetching_start");
    final storageRef = FirebaseStorage.instance.ref().child("");
    final listResult = await storageRef.listAll();
    for (var prefix in listResult.prefixes) {
      // The prefixes under storageRef.
      // You can call listAll() recursively on them.
    }
    for (var item in listResult.items) {
      // The items under storageRef.
      print(item.name);
      print(await item.getDownloadURL());
      _songsList
          .add(Song(title: item.name, songUrl: await item.getDownloadURL()));
      notifyListeners();
    }
    print("fetching_end");
  }
}
