import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

// ignore: must_be_immutable
class FinalScreen extends StatefulWidget {
  String data;
  FinalScreen({
    super.key,
    required this.data,
  });

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  String selectLanguage = 'Hindi'; // Default Language
  FlutterTts flutterTts = FlutterTts();

  final List<String> language = [
    'Hindi',
    'English',
    'French',
    'Japanese',
  ];
  void _speak(String data) async {
    await flutterTts.speak(data);
  }

  void _stop() async {
    await flutterTts.stop();
  }

  void _resume() {
    flutterTts.continueHandler;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Listen")),
      ),
      body: Column(
        children: [
          const SizedBox(width: 16),
          _buildDropdown(
            'Select Language',
            language,
            selectLanguage,
            (value) {
              setState(() {
                selectLanguage = value!;
              });
              log(selectLanguage);
            },
          ),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Center(
              child: Column(children: [
                InkWell(
                  onTap: () {
                    _speak(widget.data);
                  },
                  child: const Icon(Icons.play_arrow),
                ),
                const Text("Start"),
              ]),
            ),
            const SizedBox(width: 30),
            Center(
              child: Column(children: [
                InkWell(
                  onTap: () {
                    _stop();
                  },
                  child: const Icon(Icons.stop),
                ),
                const Text("Stop"),
              ]),
            ),
            const SizedBox(width: 30),
            Center(
              child: Column(children: [
                InkWell(
                  onTap: () {
                    _resume();
                  },
                  child: const Icon(Icons.stop),
                ),
                const Text("Resume"),
              ]),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String selectedValue,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}
