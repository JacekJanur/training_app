import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:training_app/global/data/randomize_trainings.dart';
import 'package:training_app/global/data/training_schemas.dart';
import 'package:training_app/global/models/exercise.dart';
import 'package:training_app/global/models/training.dart';
import 'package:training_app/global/models/training_schema.dart';

part 'global_training_state.dart';

class GlobalTrainingCubit extends Cubit<GlobalTrainingState> {
  GlobalTrainingCubit()
      : super(
          GlobalTrainingState.initial(),
        );

  Timer? _timer;
  onTick(Timer timer) {
    emit(state.copyWith(actualRestTime: state.actualRestTime + 1));
  }

  void pickChartData({String? exercise}) {
    emit(
      state.copyWith(
        pickedChartData: exercise,
      ),
    );
  }

  void submitTraining() {
    _timer?.cancel();
    var newState = state.copyWith(
      actualRestTime: 0,
      newTrainingModel: state.newTrainingModel.copyWith(
        isFinished: true,
      ),
    );
    newState = newState.copyWith(
      trainingHistory: [
        newState.newTrainingModel,
        ...newState.trainingHistory,
      ],
    );
    newState = newState.copyWith(
      newTrainingModel: TrainingModel(
        trainingSchema:
            state.newTrainingModel.trainingSchema.name == 'Workout B'
                ? TrainingSchemaModel.trainingA()
                : TrainingSchemaModel.trainingB(),
        date: DateTime.now().add(
          const Duration(
            days: 2,
          ),
        ),
        isFinished: false,
      ),
    );
    emit(newState);
  }

  void addReps({
    required int exerciseIndex,
    required int seriesIndex,
  }) {
    final exercise =
        state.newTrainingModel.trainingSchema.exercises[exerciseIndex];
    var newState = state;
    var repsToAdd = exercise.repsNumber;
    if (exercise.repsDone.length > seriesIndex) {
      _handleExistingRep(
          newState, exerciseIndex, seriesIndex, repsToAdd, exercise);
    } else {
      if (state.actualRestTime == 0) {
        _timer = Timer.periodic(const Duration(seconds: 1), onTick);
      } else {
        newState
            .newTrainingModel.trainingSchema.exercises[exerciseIndex].restTimes
            .add(state.actualRestTime);
        emit(state.copyWith(actualRestTime: 0));
        newState = newState.copyWith(actualRestTime: 0);
      }
      newState.newTrainingModel.trainingSchema.exercises[exerciseIndex].repsDone
          .add(repsToAdd);
    }

    emit(
      newState.copyWith(
        refresh: !newState.refresh,
      ),
    );
  }

  void _handleExistingRep(GlobalTrainingState newState, int exerciseIndex,
      int seriesIndex, int repsToAdd, ExerciseModel exercise) {
    if (newState.newTrainingModel.trainingSchema.exercises[exerciseIndex]
            .repsDone[seriesIndex] <
        1) {
      newState.newTrainingModel.trainingSchema.exercises[exerciseIndex]
          .repsDone[seriesIndex] = repsToAdd;
    } else {
      newState.newTrainingModel.trainingSchema.exercises[exerciseIndex]
          .repsDone[seriesIndex] = exercise.repsDone[seriesIndex] - 1;
    }
  }

  void setWeight({required int weight}) {
    emit(state.copyWith(
        newTrainingModel: state.newTrainingModel.copyWith(
      bodyWeight: weight,
    )));
  }
}
