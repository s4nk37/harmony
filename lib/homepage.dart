import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'page_manager.dart';
import 'song_tile.dart';
import 'package:provider/provider.dart';
import 'song.dart';
import 'constants.dart' as constants;

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
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: constants.bgScaffold,
      appBar: constants.myAppBar,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/waves.png"),
                    opacity: 0.4,
                    fit: BoxFit.fill),
              ),
              child: Row(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Good ${constants.greeting()}!",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45,
                          letterSpacing: 0.7),
                    ),
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
            Expanded(
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
      bottomNavigationBar: Container(
        height: width > 500 && height < 500 ? height * 0.3 : height * 0.15,
        color: constants.bgMusicControls,
        padding: EdgeInsets.only(
            top: height * 0.15 * 0.2, left: width * 0.07, right: width * 0.07),
        child: Column(
          children: [
            ValueListenableBuilder<ProgressBarState>(
              valueListenable: _pageManager.progressNotifier,
              builder: (_, value, __) {
                return ProgressBar(
                  progress: value.current,
                  barHeight: height * 0.15 * 0.015,
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
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: IconButton(
                    icon: const Icon(Icons.fast_rewind),
                    iconSize: 32.0,
                    onPressed: _pageManager.previousTen,
                  ),
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
                        return FittedBox(
                          fit: BoxFit.scaleDown,
                          child: IconButton(
                            icon: const Icon(Icons.play_arrow),
                            iconSize: 32.0,
                            onPressed: _pageManager.play,
                          ),
                        );
                      case ButtonState.playing:
                        return FittedBox(
                          fit: BoxFit.scaleDown,
                          child: IconButton(
                            icon: const Icon(Icons.pause),
                            iconSize: 32.0,
                            onPressed: _pageManager.pause,
                          ),
                        );
                    }
                  },
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: IconButton(
                    icon: const Icon(Icons.fast_forward),
                    iconSize: 32.0,
                    onPressed: _pageManager.nextTen,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
