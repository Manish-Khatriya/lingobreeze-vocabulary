import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/vocabulary_provider.dart';
import '../widgets/add_word_bottom_sheet.dart';
import '../widgets/empty_state.dart';
import '../widgets/word_card.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
    context.read<VocabularyProvider>();

    return Scaffold(
      backgroundColor:
      const Color(0xffF5F7FB),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.menu_book_rounded,
              color: Color(0xFF6C63FF),
              size: 28,
            ),
            SizedBox(width: 8),
            Text(
              "My Vocabulary",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) =>
            const AddWordBottomSheet(),
          );
        },

        icon: const Icon(Icons.add),

        label: const Text(
          "Add Word",
        ),
      ),

      body: StreamBuilder(
        stream:
        provider.getSavedWords(),

        builder: (
            context,
            snapshot,
            ) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "Something went wrong",
              ),
            );
          }

          final words =
              snapshot.data ?? [];

          if (words.isEmpty) {

            return EmptyState(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled:
                  true,
                  builder: (_) =>
                  const AddWordBottomSheet(),
                );
              },
            );
          }

          return Column(
            children: [

              Padding(
                padding:
                const EdgeInsets.all(16),
                child: Align(
                  alignment:
                  Alignment.centerLeft,
                  child: Text(
                    "${words.length} Saved Words",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight:
                      FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(
                      const Duration(milliseconds: 500),
                    );
                  },
                  child: ListView.builder(
                    itemCount: words.length,
                    itemBuilder: (context, index) {
                      final word = words[index];

                      return WordCard(
                        word: word.word,
                        meaning: word.meaning,
                        translation: word.translation,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}