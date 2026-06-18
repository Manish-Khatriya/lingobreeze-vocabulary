import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/word_model.dart';

class ApiService {

  static const String baseUrl =
      "http://10.0.2.2:3000";

  Future<List<WordModel>> getWords() async {

    final response = await http.get(
      Uri.parse("$baseUrl/words"),
    );

    if (response.statusCode == 200) {

      final List data =
      jsonDecode(response.body);

      return data
          .map(
            (e) => WordModel.fromJson(e),
      )
          .toList();

    } else {

      throw Exception(
        "Failed to load words",
      );
    }
  }
}