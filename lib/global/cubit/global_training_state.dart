part of 'global_training_cubit.dart';

class GlobalTrainingState {
  GlobalTrainingState({
    required this.trainingHistory,
    required this.newTrainingModel,
    required this.refresh,
    required this.actualRestTime,
    this.pickedChartData,
  });
  factory GlobalTrainingState.initial() => GlobalTrainingState(
        refresh: false,
        actualRestTime: 0,
        trainingHistory: generateRandomTrainings(),
        newTrainingModel: TrainingModel(
          trainingSchema: TrainingSchemaModel.trainingA(),
          date: DateTime.now(),
          isFinished: false,
        ),
      );
  final List<TrainingModel> trainingHistory;
  final String? pickedChartData;
  final TrainingModel newTrainingModel;
  final bool refresh;
  final int actualRestTime;

  GlobalTrainingState copyWith({
    List<TrainingModel>? trainingHistory,
    String? pickedChartData,
    TrainingModel? newTrainingModel,
    int? actualRestTime,
    bool? refresh,
  }) =>
      GlobalTrainingState(
        actualRestTime: actualRestTime ?? this.actualRestTime,
        trainingHistory: trainingHistory ?? this.trainingHistory,
        newTrainingModel: newTrainingModel ?? this.newTrainingModel,
        refresh: refresh ?? this.refresh,
        pickedChartData: pickedChartData,
      );
}
