import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/global/cubit/global_training_cubit.dart';

import '../../../global/models/exercise.dart';
import 'workout_exercise_reps.dart';

class WorkoutExerciseSeries extends StatelessWidget {
  const WorkoutExerciseSeries({
    super.key,
    required this.exercise,
    required this.index,
  });
  final ExerciseModel exercise;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 16,
            ),
            for (int i = 0; i < exercise.seriesNumber; i++)
              WorkoutExerciseReps(
                exercise: exercise,
                index: index,
                seriesIndex: i,
              ),
          ],
        ),
      ),
    );
  }
}
