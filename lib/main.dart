import 'package:flutter/material.dart';
import 'story_input_page.dart';

void main() {
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
      home: StoryInputPage(
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        isDarkMode: isDarkMode,
      ),
    );
  }
}
