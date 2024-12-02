import 'package:ai_story_gen/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/story_input_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const StoryGenApp());
}

class StoryGenApp extends StatefulWidget {
  const StoryGenApp({super.key});

  @override
  _StoryGenAppState createState() => _StoryGenAppState();
}

class _StoryGenAppState extends State<StoryGenApp> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      // home: StoryInputPage(
      //   toggleTheme: () {
      //     setState(() {
      //       isDarkMode = !isDarkMode;
      //     });
      //   },
      //   isDarkMode: isDarkMode,
      // ),
      home: const LoginScreen(),
    );
  }
}
