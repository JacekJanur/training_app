import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global/cubit/global_training_cubit.dart';
import 'profile_training_history_element.dart';

class ProfileTrainingHistory extends StatelessWidget {
  const ProfileTrainingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<GlobalTrainingCubit, GlobalTrainingState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: state.trainingHistory.length,
            (context, index) {
              final training = state.trainingHistory[index];
              return ProfileTrainingHistoryElement(training: training);
            },
          ),
        );
      },
    );
  }
}
