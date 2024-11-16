import 'package:google_generative_ai/google_generative_ai.dart';

class StoryGenService {
  // Method to call the API and generate a story
  static Future<String?> generateStory(
      String prompt, String genre, String theme) async {
    const String apiKey = 'AIzaSyBsc3eWVvEHui13suO5Xgy0p6ju6Y2vYt0';
    // const String apiUrl =
    //     'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent';
    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apiKey,
    );
    final response = await model.generateContent([
      Content.text(
          "this is my prompt'$prompt' and set  $genre and $theme of  this story.")
    ]);

    // final Map<String, dynamic> requestBody = {
    //   "prompt": prompt,
    //   "genre": genre,
    //   "theme": theme,
    //   "maxTokens": 100,
    //   "temperature": 0.7,
    // };

    // final response = await http.post(
    //   Uri.parse(apiUrl),
    //   headers: {
    //     "Content-Type": "application/json",
    //     "Authorization": "Bearer $apiKey",
    //   },
    //   body: json.encode(requestBody),
    // );
    final data = response.text;
    return data;
    // const data = json.decode(response.text);
    // if (response.statusCode == 200) {
    //   final data = json.decode(response.body);
    //   return data['story'];
    // } else {
    //   throw Exception('Failed to generate story');
    // }
  }
}
