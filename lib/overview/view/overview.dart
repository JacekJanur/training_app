import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/global/cubit/global_training_cubit.dart';
import 'package:training_app/overview/view/widget/overview_main_chart.dart';

import '../../global/models/training.dart';
import 'widget/overview_pick_data.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalTrainingCubit, GlobalTrainingState>(
      builder: (context, state) {
        List<String> uniqueExerciseNames = state.trainingHistory
            .expand((training) => training.trainingSchema.exercises)
            .map((exercise) => exercise.name)
            .toSet()
            .toList();

        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 300,
              child: OverviewMainChart(
                trainings: state.trainingHistory,
              ),
            ),
            OverviewPickData(uniqueExerciseNames: uniqueExerciseNames)
          ],
        );
      },
    );
  }
}
