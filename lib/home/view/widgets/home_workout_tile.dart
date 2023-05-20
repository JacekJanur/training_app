import 'package:flutter/material.dart';

import '../../../global/view/widgets/global_row_texts.dart';

class HomeWorkoutTile extends StatelessWidget {
  const HomeWorkoutTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            GlobalRowTexts(
              isTitle: true,
              leftText: 'Workout A',
              rightText: 'Today',
            ),
            GlobalRowTexts(
              leftText: 'Squat',
              rightText: '5x5 50kg',
            ),
            GlobalRowTexts(
              leftText: 'Squat',
              rightText: '5x5 50kg',
            ),
            GlobalRowTexts(
              leftText: 'Squat',
              rightText: '5x5 50kg',
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
