import 'package:flutter/material.dart';

import 'package:ai_story_gen/story_gen_service.dart';

class OutputDisplay extends StatefulWidget {
  String data;
  final String selectedGenre;
  final String selectedTheme;
  OutputDisplay({
    super.key,
    required this.data,
    required this.selectedGenre,
    required this.selectedTheme,
  });

  @override
  State<OutputDisplay> createState() => _OutputDisplayState();
}

class _OutputDisplayState extends State<OutputDisplay> {
  String? data1;
  bool _isLoading = false;
  bool _isGenerate = false;
  Future<void> _refreshStroy() async {
    setState(() {
      _isLoading = true;
      _isGenerate = true;
    });
    try {
      data1 = await StoryGenService.generateStory("${widget.data} refresh it ",
          widget.selectedGenre, widget.selectedTheme);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to refresh.')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
        child: Column(children: [
          Text(
            _isGenerate ? data1.toString() : widget.data,
            style: const TextStyle(fontSize: 16.0),
          ),
          ElevatedButton(onPressed: () {}, child: const Icon(Icons.add))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshStroy,
        child: _isLoading
            ? const CircularProgressIndicator()
            : const Icon(Icons.refresh),
      ),
    );
  }
}
