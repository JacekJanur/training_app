import 'package:flutter/material.dart';

import '../../../global/models/exercise.dart';
import 'workout_details_exercise_chart.dart';

class WorkoutDetailsExercise extends StatelessWidget {
  const WorkoutDetailsExercise({
    super.key,
    required this.exercise,
  });

  final ExerciseModel exercise;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(
          '${'${exercise.name} ${exercise.seriesNumber}'}x${exercise.repsNumber}'),
      children: [
        WorkoutDetailsExerciseHistogramChart(
          exercise: exercise,
          histogramType: WorkoutHistogramType.series,
        ),
        WorkoutDetailsExerciseHistogramChart(
          exercise: exercise,
          histogramType: WorkoutHistogramType.reps,
        ),
      ],
    );
  }
}
