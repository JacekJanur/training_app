import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/global/cubit/global_training_cubit.dart';
import 'package:training_app/global/src/modals/global_confirmation_modal.dart';
import 'package:training_app/global/view/widgets/global_row_texts.dart';

import 'widgets/workout_exercise_tile.dart';
import 'widgets/workout_weight.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalTrainingCubit, GlobalTrainingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.newTrainingModel.trainingSchema.name),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showConfirmationModal<bool?>(
                      context: context,
                      description: 'Do you want to end workout?')
                  .then((value) {
                if (value == null || !value) {
                  return;
                }
                context.read<GlobalTrainingCubit>().submitTraining();
                Navigator.of(context).pop();
              });
            },
            child: const Icon(
              Icons.stop_circle,
              size: 40,
            ),
          ),
          body: Column(
            children: [
              for (var i = 0;
                  i < state.newTrainingModel.trainingSchema.exercises.length;
                  i++)
                WorkoutExerciseTile(
                  exercise: state.newTrainingModel.trainingSchema.exercises[i],
                  index: i,
                ),
              const SizedBox(
                height: 16,
              ),
              WorkoutWeight(weight: state.newTrainingModel.bodyWeight ?? 0),
              Container(
                margin: const EdgeInsets.only(top: 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GlobalRowTexts(
                  leftText: 'Actual Rest Time',
                  rightText: '${state.actualRestTime.toString()}s',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
