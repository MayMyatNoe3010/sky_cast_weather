import 'package:flutter/material.dart';

import '../../../../../core/res/dimensions.dart';

class CardInsideTitleWidget extends StatelessWidget {
  String title, content;
   CardInsideTitleWidget({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingS),
      child: Column(
        // Optional: Align the column contents to the start (left)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          Text(
            content,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),

          ),
        ],
      ),
    );
  }
}
