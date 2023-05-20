import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/global/cubit/global_training_cubit.dart';

import '../../../global/view/widgets/global_row_texts.dart';
import '../dialogs/workout_pick_weight.dart';

class WorkoutWeight extends StatelessWidget {
  const WorkoutWeight({
    super.key,
    required this.weight,
  });

  final int weight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GlobalRowTexts(
        leftText: 'Body Weight',
        rightText: '${weight}kg',
        isTitle: true,
        rightColor: const Color.fromARGB(255, 18, 104, 174),
        rightOnTap: () async {
          showDialog<int?>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Change Body Weight',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              content: const WorkoutPickWeight(),
            ),
          ).then((value) {
            if (value is int) {
              context.read<GlobalTrainingCubit>().setWeight(weight: value);
            }
          });
        },
      ),
    );
  }
}
