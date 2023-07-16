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
    final storageRef = FirebaseStorage.instance.ref().child("");
    final listResult = await storageRef.listAll();
    for (var item in listResult.items) {
      _songsList
          .add(Song(title: item.name, songUrl: await item.getDownloadURL()));
      notifyListeners();
    }
  }
}
