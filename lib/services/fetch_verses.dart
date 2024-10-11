import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:la_biblia/models/verse.dart';
import 'package:la_biblia/providers/main_provider.dart';

// Class responsible for fetching verses from a JSON file

class FetchVerses {
  // Static method to execute the fetching process
  static Future<void> execute({required MainProvider mainProvider}) async {
    // Load the JSON file content as a string from the assets folder
    String jsonString = await rootBundle.loadString('assets/bible.json');

    // Decode the JSON string into a List of dynamic objects
    List<dynamic> jsonList = json.decode(jsonString);

    // Loop through each JSON object, then convert it to a Verse, and add it to the provider's list

    for (var json in jsonList) {
      mainProvider.addVerse(verse: Verse.fromJson(json));
    }
  }
}
