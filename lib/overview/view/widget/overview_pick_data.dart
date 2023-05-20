import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/global/cubit/global_training_cubit.dart';

class OverviewPickData extends StatelessWidget {
  const OverviewPickData({
    super.key,
    required this.uniqueExerciseNames,
  });

  final List<String> uniqueExerciseNames;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalTrainingCubit>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        children: [
          TextButton(
            onPressed: () {
              context.read<GlobalTrainingCubit>().pickChartData();
            },
            child: Text(
              'Body Weight',
              style: TextStyle(
                color:
                    state.pickedChartData == null ? Colors.blue : Colors.black,
              ),
            ),
          ),
          for (var name in uniqueExerciseNames)
            TextButton(
              onPressed: () {
                context.read<GlobalTrainingCubit>().pickChartData(
                      exercise: name,
                    );
              },
              child: Text(
                name,
                style: TextStyle(
                  color: state.pickedChartData == name
                      ? Colors.blue
                      : Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
