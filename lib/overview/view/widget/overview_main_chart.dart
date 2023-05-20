import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/global/cubit/global_training_cubit.dart';

import '../../../global/data/randomize_trainings.dart';
import '../../../global/models/training.dart';

class OverviewMainChart extends StatelessWidget {
  final List<TrainingModel> trainings;

  const OverviewMainChart({super.key, required this.trainings});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GlobalTrainingCubit>().state;
    List<LineChartBarData> lines = _prepareData(state);

    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            axisNameWidget: const Text("kg"),
          ),
          topTitles: AxisTitles(
            axisNameWidget: const Text("Training number"),
          ),
        ),
        lineBarsData: lines,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  List<LineChartBarData> _prepareData(
    GlobalTrainingState state,
  ) {
    Map<String, List<int>> exerciseWeights = {};
    if (state.pickedChartData != null) {
      _takeSport(state, exerciseWeights);
    }

    List<LineChartBarData> lines = [];
    _addLinesForEachSport(exerciseWeights, lines);
    if (state.pickedChartData == null) {
      _addWeight(lines);
    }
    return lines;
  }

  void _addWeight(List<LineChartBarData> lines) {
    lines.add(
      LineChartBarData(
        spots: [
          for (int i = 0; i < trainings.length; i++)
            FlSpot(i + 1,
                trainings.reversed.toList()[i].bodyWeight?.toDouble() ?? 0),
        ],
        barWidth: 3,
        isStrokeCapRound: true,
        color: Colors.blue,
      ),
    );
  }

  void _addLinesForEachSport(
      Map<String, List<int>> exerciseWeights, List<LineChartBarData> lines) {
    exerciseWeights.forEach((exercise, weights) {
      lines.add(
        LineChartBarData(
          spots: weights.reversed
              .toList()
              .asMap()
              .entries
              .map(
                (entry) =>
                    FlSpot(entry.key.toDouble() + 1, entry.value.toDouble()),
              )
              .toList(),
          barWidth: 3,
          isStrokeCapRound: true,
          color: Colors.blue,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      );
    });
  }

  void _takeSport(
      GlobalTrainingState state, Map<String, List<int>> exerciseWeights) {
    for (var training in trainings) {
      for (var exercise in training.trainingSchema.exercises.where(
        (element) => element.name == state.pickedChartData,
      )) {
        if (!exerciseWeights.containsKey(exercise.name)) {
          exerciseWeights[exercise.name] = [];
        }
        exerciseWeights[exercise.name]!.add(exercise.weight);
      }
    }
  }
}
