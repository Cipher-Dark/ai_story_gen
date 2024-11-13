import 'package:ai_story_gen/story_gen_service.dart';
import 'package:flutter/material.dart';

class OutputDisplay extends StatefulWidget {
  final String data;
  final String selectedGenre;
  final String selectedTheme;
  const OutputDisplay({
    super.key,
    required this.data,
    required this.selectedGenre,
    required this.selectedTheme,
  });

  @override
  State<OutputDisplay> createState() => _OutputDisplayState();
}

class _OutputDisplayState extends State<OutputDisplay> {
  void _generateStory(String data, String selectedGenre, String selectedTheme) {
    setState(() {
      (String data, String selectedGenre, String selectedTheme) async {
        String? story = await StoryGenService.generateStory(
          data,
          selectedGenre,
          selectedTheme,
        );
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    // String selectedThem = this.selectedTheme;
    // String selectedGenr = this.selectedGenre;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Story Generated"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.data,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
      // floatingActionButton: const FloatingActionButton(
      //   onPressed: _generateStory(data, selectedThem,
      //       selectedGenr), // Refresh content on button press
      //   child: Icon(Icons.refresh),
      // ),
    );
  }
}
