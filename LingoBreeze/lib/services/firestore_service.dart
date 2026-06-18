import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/word_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> saveWord(
      WordModel word,
      ) async {

    final existing =
    await _firestore
        .collection('vocabulary')
        .where(
      'word',
      isEqualTo: word.word,
    )
        .get();

    if (existing.docs.isNotEmpty) {
      return;
    }

    await _firestore
        .collection('vocabulary')
        .add(
      word.toJson(),
    );
  }

  Stream<List<WordModel>> getSavedWords() {
    return _firestore
        .collection('vocabulary')
        .snapshots()
        .map(
          (snapshot) {
        return snapshot.docs.map((doc) {
          return WordModel.fromJson(
            doc.data(),
          );
        }).toList();
      },
    );
  }
}