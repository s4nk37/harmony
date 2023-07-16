import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:harmony/song.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'homepage.dart';

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
    return ChangeNotifierProvider(
      create: (ctx) => Songs(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        title: "Harmony",
      ),
    );
  }
}
