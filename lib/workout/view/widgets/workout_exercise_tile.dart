import 'package:flutter/material.dart';
import 'package:training_app/global/models/exercise.dart';

import '../../../global/view/widgets/global_row_texts.dart';
import 'workout_exercise_series.dart';

class WorkoutExerciseTile extends StatelessWidget {
  const WorkoutExerciseTile({
    super.key,
    required this.exercise,
    required this.index,
  });
  final ExerciseModel exercise;
  final int index;

  @override
  Widget build(BuildContext context) {
    final reps = exercise.repsNumber;
    final series = exercise.seriesNumber;
    final weight = exercise.weight;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: GlobalRowTexts(
              isTitle: true,
              leftText: exercise.name,
              rightText: '${series}x$reps ${weight}kg',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          WorkoutExerciseSeries(exercise: exercise, index: index),
        ],
      ),
    );
  }
}
