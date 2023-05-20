import 'package:flutter/material.dart';

import '../../../global/models/exercise.dart';

class ProfileTrainingExercise extends StatelessWidget {
  const ProfileTrainingExercise({
    super.key,
    required this.exercise,
  });

  final ExerciseModel exercise;

  @override
  Widget build(BuildContext context) {
    final isCompleted = exercise.repsDone.every(
          (element) => element == exercise.repsNumber,
        ) &&
        exercise.repsDone.length == exercise.seriesNumber;
    return Text(
      exercise.name,
      style: TextStyle(color: isCompleted ? Colors.green : Colors.red),
    );
  }
}
