import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class EmptyState extends StatelessWidget {
  final VoidCallback onPressed;

  const EmptyState({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu_book_rounded,
              size: 80,
              color: AppColors.primary,
            ),

            const SizedBox(height: 20),

            const Text(
              AppStrings.emptyMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.add),
              label: const Text(
                "Add Your First Word",
              ),
            )
          ],
        ),
      ),
    );
  }
}