import 'package:flutter/material.dart';

import 'widgets/home_workout_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          HomeWorkoutTile(),
          HomeWorkoutTile(),
          HomeWorkoutTile(),
        ],
      ),
    );
  }
}
