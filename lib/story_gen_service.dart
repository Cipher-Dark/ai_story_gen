import 'dart:developer';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class StoryGenService {
  // Method to call the API and generate a story
  static Future<String?> generateStory(
      // final keyy = dotenv.env['GEMINI_API_KEY'];
      // log(keyy.toString());
      String prompt,
      String genre,
      String theme) async {
    const String apiKey = 'AIzaSyBsc3eWVvEHui13suO5Xgy0p6ju6Y2vYt0';

    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
    );
    final response = await model.generateContent([
      Content.text(
          "this is my prompt'$prompt' and set  $genre and $theme of  this story.")
    ]);
    return response.text;
  }
}
