import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/global/cubit/global_training_cubit.dart';

import '../../../global/models/exercise.dart';

class WorkoutExerciseReps extends StatelessWidget {
  const WorkoutExerciseReps({
    super.key,
    required this.exercise,
    required this.index,
    required this.seriesIndex,
  });
  final ExerciseModel exercise;
  final int index;
  final int seriesIndex;

  @override
  Widget build(BuildContext context) {
    final bgColor = exercise.repsDone.length <= seriesIndex
        ? const Color.fromARGB(255, 237, 237, 246)
        : const Color.fromARGB(255, 55, 128, 57);

    final textColor =
        exercise.repsDone.length <= seriesIndex ? Colors.black : Colors.white;

    final repsToShow = exercise.repsDone.length > seriesIndex
        ? exercise.repsDone[seriesIndex]
        : 0;

    return InkWell(
      onTap: () {
        context.read<GlobalTrainingCubit>().addReps(
              exerciseIndex: index,
              seriesIndex: seriesIndex,
            );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: bgColor,
          child: Text(
            repsToShow.toString(),
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
