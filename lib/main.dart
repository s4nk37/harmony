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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        height: 100,
        color: Colors.black26,
        child: Center(
          child: IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
        ),
      ),
    );
  }
}
