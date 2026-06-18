class WordModel {
  final String word;
  final String meaning;
  final String translation;

  WordModel({
    required this.word,
    required this.meaning,
    required this.translation,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'] ?? '',
      meaning: json['meaning'] ?? '',
      translation: json['translation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'meaning': meaning,
      'translation': translation,
    };
  }
}