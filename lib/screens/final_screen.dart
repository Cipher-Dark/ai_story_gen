import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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

  final List<String> language = [
    'Hindi',
    'English',
    'French',
    'Japanese',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Listen")),
      ),
      body: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: _buildDropdown(
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
          ),
          const SizedBox(width: 16),
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
