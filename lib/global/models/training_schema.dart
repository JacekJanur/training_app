import 'exercise.dart';

class TrainingSchemaModel {
  final String name;
  final List<ExerciseModel> exercises;

  TrainingSchemaModel({
    required this.name,
    required this.exercises,
  });

  factory TrainingSchemaModel.fromJson(Map<String, dynamic> json) {
    return TrainingSchemaModel(
      name: json['name'],
      exercises: (json['exercises'] as List<dynamic>)
          .map((item) => ExerciseModel.fromJson(item))
          .toList(),
    );
  }

  TrainingSchemaModel copyWith({
    String? name,
    List<ExerciseModel>? exercises,
  }) {
    return TrainingSchemaModel(
      name: name ?? this.name,
      exercises: exercises ?? this.exercises,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'exercises': exercises.map((item) => item.toJson()).toList(),
    };
  }

  factory TrainingSchemaModel.trainingA() => TrainingSchemaModel(
        name: 'Workout A',
        exercises: [
          ExerciseModel.exerciseSquat(),
          ExerciseModel.exerciseBenchPress(),
          ExerciseModel.exerciseBarellRow(),
        ],
      );

  factory TrainingSchemaModel.trainingB() => TrainingSchemaModel(
        name: 'Workout B',
        exercises: [
          ExerciseModel.exerciseSquat(),
          ExerciseModel.exerciseOverheadPress(),
          ExerciseModel.exerciseDeadlift(),
        ],
      );
}
