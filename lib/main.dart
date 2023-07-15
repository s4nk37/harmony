import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Harmony",
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late final PageManager _pageManager;
  late final player = AudioPlayer(); // Create a player

  // Future<void> playSong() async {
  //   final duration =
  // }

  @override
  void initState() {
    super.initState();

    // _pageManager = PageManager();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harmony"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              color: Colors.deepOrangeAccent.withOpacity(0.2),
              child: ListTile(
                title: Text("Something just like this"),
                subtitle: Text("The Chainsmokers & coldplay"),
                onTap: () {},
              ),
            ),
            Container(
              color: Colors.deepOrangeAccent.withOpacity(0.2),
              child: ListTile(
                title: Text("Something just like this"),
                subtitle: Text("The Chainsmokers & coldplay"),
              ),
            ),
            Container(
              color: Colors.deepOrangeAccent.withOpacity(0.2),
              child: ListTile(
                title: Text("Something just like this"),
                subtitle: Text("The Chainsmokers & coldplay"),
              ),
            ),
            Container(
              color: Colors.deepOrangeAccent.withOpacity(0.2),
              child: ListTile(
                title: Text("Something just like this"),
                subtitle: Text("The Chainsmokers & coldplay"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 200,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(),
            const ProgressBar(
              progress: Duration.zero,
              total: Duration.zero,
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 32.0,
              onPressed: () async {
                await player.setUrl(
                    'https://thepaciellogroup.github.io/AT-browser-tests/audio/jeffbob.mp3');
                player.play();
              },
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 32.0,
              onPressed: () {
                player.pause();
              },
            ),
          ],
        ),
      ),
    );
  }
}
