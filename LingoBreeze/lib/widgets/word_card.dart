import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final String word;
  final String meaning;
  final String translation;

  const WordCard({
    super.key,
    required this.word,
    required this.meaning,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const Icon(
                Icons.auto_stories_rounded,
                color: Color(0xFF6C63FF),
                size: 28,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  word,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Meaning",
            style: TextStyle(
              fontWeight:
              FontWeight.w600,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            meaning,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Translation",
            style: TextStyle(
              fontWeight:
              FontWeight.w600,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            translation,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}