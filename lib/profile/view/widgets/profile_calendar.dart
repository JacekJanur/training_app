import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:intl/intl.dart';

import 'package:training_app/global/cubit/global_training_cubit.dart';
import 'package:training_app/global/models/training.dart';

import '../../../workout_details/workout_details.dart';

class ProfileCalendar extends StatelessWidget {
  const ProfileCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<GlobalTrainingCubit, GlobalTrainingState>(
        builder: (context, state) {
          final datasets = _generateDates(state);

          return HeatMapCalendar(
            onClick: (pickedDate) {
              final training = state.trainingHistory.firstWhere(
                (element) =>
                    DateFormat('dd-MM-yyyy').format(element.date) ==
                    DateFormat('dd-MM-yyyy').format(pickedDate),
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WorkoutDetails(training: training),
                ),
              );
            },
            showColorTip: false,
            defaultColor: const Color.fromARGB(255, 232, 240, 232),
            colorMode: ColorMode.color,
            datasets: datasets,
            textColor: Colors.black,
            colorsets: const {
              1: Color.fromARGB(255, 101, 230, 105),
            },
          );
        },
      ),
    );
  }

  Map<DateTime, int> _generateDates(GlobalTrainingState state) {
    return Map.fromIterable(
      state.trainingHistory,
      key: (element) {
        element as TrainingModel;
        return DateUtils.dateOnly(element.date);
      },
      value: (element) => 1,
    );
  }
}
