import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../global/models/exercise.dart';

enum WorkoutHistogramType { reps, series }

class WorkoutDetailsExerciseHistogramChart extends StatelessWidget {
  final ExerciseModel exercise;
  final WorkoutHistogramType histogramType;

  const WorkoutDetailsExerciseHistogramChart({
    super.key,
    required this.exercise,
    required this.histogramType,
  });

  @override
  Widget build(BuildContext context) {
    var xTitle;
    var yTitle;
    switch (histogramType) {
      case WorkoutHistogramType.reps:
        xTitle = 'Series';
        yTitle = 'Reps';
        break;
      case WorkoutHistogramType.series:
        xTitle = 'Series';
        yTitle = 'Rest [s]';
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 200,
        child: BarChart(
          BarChartData(
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                axisNameWidget: Text(
                  yTitle,
                ),
              ),
              topTitles: AxisTitles(
                axisNameWidget: Text(
                  xTitle,
                ),
              ),
            ),
            barGroups: _getBarGroups(),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    List<BarChartGroupData> barGroups = [];
    for (int i = 0; i < exercise.restTimes.length; i++) {
      var y;
      y = _pickY(y, i);
      barGroups.add(
        BarChartGroupData(
          x: i + 1,
          barRods: [
            BarChartRodData(
              toY: y,
              width: 10,
            ),
          ],
        ),
      );
    }
    return barGroups;
  }

  _pickY(y, int i) {
    switch (histogramType) {
      case WorkoutHistogramType.reps:
        y = exercise.repsDone[i].toDouble().isNaN
            ? 0.0
            : exercise.repsDone[i].toDouble();
        break;
      case WorkoutHistogramType.series:
        y = exercise.restTimes[i].toDouble().isNaN
            ? 0.0
            : exercise.restTimes[i].toDouble();
        break;
    }
    return y;
  }
}
