import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training_app/global/models/exercise.dart';
import 'package:training_app/workout_details/workout_details.dart';

import '../../../global/models/training.dart';
import '../../../global/view/widgets/global_row_texts.dart';
import 'profile_training_exercise.dart';

class ProfileTrainingHistoryElement extends StatelessWidget {
  const ProfileTrainingHistoryElement({
    super.key,
    required this.training,
  });

  final TrainingModel training;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WorkoutDetails(training: training),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalRowTexts(
                  isBold: true,
                  leftText: training.trainingSchema.name,
                  rightText: DateFormat('dd-MM-yyyy').format(
                    training.date,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                for (final exercise in training.trainingSchema.exercises)
                  ProfileTrainingExercise(exercise: exercise)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
