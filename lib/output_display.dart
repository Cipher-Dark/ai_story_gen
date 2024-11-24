import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:ai_story_gen/story_gen_service.dart';

// ignore: must_be_immutable
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
  bool _isEditing = false;

  TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = !_isGenerate ? widget.data : data1.toString();
  }

  Future<void> _refreshStroy() async {
    setState(() {
      _isLoading = true;
      _isGenerate = true;
    });
    try {
      data1 = await StoryGenService.generateStory(
          "${_textEditingController.text} refresh it ",
          widget.selectedGenre,
          widget.selectedTheme);
      _textEditingController.text = data1!;
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

  void _isToggle() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String selectedThem = this.selectedTheme;
    // String selectedGenr = this.selectedGenre;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black87,
        title: const Text("Story Generated"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          _isEditing
              ? TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 1,
                  scrollController: _scrollController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Edit Story"),
                )
              : Text(
                  _textEditingController.text,
                  style: const TextStyle(fontSize: 16.0),
                ),
          ElevatedButton(
              onPressed: _isToggle,
              child: _isEditing
                  ? const Icon(Icons.next_plan)
                  : const Icon(Icons.edit))
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
