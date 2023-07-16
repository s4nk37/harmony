import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'page_manager.dart';
import 'song_tile.dart';
import 'package:provider/provider.dart';
import 'song.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageManager _pageManager;

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Songs>(context);

    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
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
        backgroundColor: Colors.indigoAccent.shade100.withOpacity(0.1),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                child: Row(
                  children: [
                    const Text(
                      "Good morning!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45,
                          letterSpacing: 0.7),
                    ),
                    IconButton(
                      onPressed: () async {
                        data.fetchSongs();
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 580,
                child: ListView.builder(
                  itemCount: data.songsList.length,
                  itemBuilder: (ctx, index) => SongTile(
                      id: index,
                      title: data.songsList[index].title,
                      play: () {
                        _pageManager.play(data.songsList[index].songUrl);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 150,
        color: Colors.indigo.shade100,
        padding: const EdgeInsets.only(top: 30.0, left: 30, right: 30),
        child: Column(
          children: [
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _pageManager.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                  progress: value.current,
                  barHeight: 3,
                  thumbColor: Colors.indigoAccent.shade200,
                  baseBarColor: Colors.indigo.shade200,
                  bufferedBarColor: Colors.white70,
                  buffered: value.buffered,
                  total: value.total,
                  onSeek: _pageManager.seek,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.fast_rewind),
                  iconSize: 32.0,
                  onPressed: _pageManager.previousTen,
                ),
                ValueListenableBuilder<ButtonState>(
                  valueListenable: _pageManager.buttonNotifier,
                  builder: (_, value, __) {
                    switch (value) {
                      case ButtonState.loading:
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          width: 32.0,
                          height: 32.0,
                          child: const CircularProgressIndicator(),
                        );
                      case ButtonState.paused:
                        return IconButton(
                          icon: const Icon(Icons.play_arrow),
                          iconSize: 32.0,
                          onPressed: _pageManager.play,
                        );
                      case ButtonState.playing:
                        return IconButton(
                          icon: const Icon(Icons.pause),
                          iconSize: 32.0,
                          onPressed: _pageManager.pause,
                        );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.fast_forward),
                  iconSize: 32.0,
                  onPressed: _pageManager.nextTen,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
