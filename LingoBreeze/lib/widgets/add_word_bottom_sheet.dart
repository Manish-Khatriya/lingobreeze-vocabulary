import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/vocabulary_provider.dart';

class AddWordBottomSheet
    extends StatefulWidget {

  const AddWordBottomSheet({
    super.key,
  });

  @override
  State<AddWordBottomSheet>
  createState() =>
      _AddWordBottomSheetState();
}

class _AddWordBottomSheetState
    extends State<AddWordBottomSheet> {

  @override
  void initState() {

    super.initState();

    Future.microtask(() {
      context
          .read<VocabularyProvider>()
          .fetchWords();
    });
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 450,

      child: Consumer<
          VocabularyProvider>(
        builder:
            (
            context,
            provider,
            child,
            ) {

          if (provider.isLoading) {

            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }

          if (provider.errorMessage !=
              null) {

            return Center(
              child: Text(
                provider.errorMessage!,
              ),
            );
          }
          return Column(
            children: [

              const SizedBox(height: 20),

              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Choose a Word",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Select a vocabulary word to save",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount:
                  provider.words.length,

                  itemBuilder:
                      (
                      context,
                      index,
                      ) {

                    final word =
                    provider.words[index];

                    return ListTile(

                      title:
                      Text(word.word),

                      subtitle:
                      Text(word.meaning),

                      trailing: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF)
                              .withOpacity(.1),
                          borderRadius:
                          BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color(0xFF6C63FF),
                        ),
                      ),

                      onTap: () async {

                        await context
                            .read<
                            VocabularyProvider>()
                            .saveWord(word);

                        if (mounted) {

                          Navigator.pop(context);

                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${word.word} saved",
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}