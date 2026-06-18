import 'package:flutter/material.dart';

import '../models/word_model.dart';
import '../services/api_service.dart';
import '../services/firestore_service.dart';

class VocabularyProvider
    extends ChangeNotifier {

  final ApiService _apiService =
  ApiService();

  final FirestoreService
  _firestoreService =
  FirestoreService();

  bool isLoading = false;

  String? errorMessage;

  List<WordModel> words = [];

  Future<void> fetchWords() async {

    try {

      isLoading = true;

      notifyListeners();

      words =
      await _apiService.getWords();

    } catch (e) {

      errorMessage = e.toString();

    } finally {

      isLoading = false;

      notifyListeners();
    }
  }

  Future<void> saveWord(
      WordModel word,
      ) async {

    await _firestoreService
        .saveWord(word);
  }

  Stream<List<WordModel>>
  getSavedWords() {

    return _firestoreService
        .getSavedWords();
  }
}