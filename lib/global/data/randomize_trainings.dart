import 'dart:math';

import 'package:training_app/global/models/exercise.dart';
import 'package:training_app/global/models/training.dart';

import '../models/training_schema.dart';
import 'training_schemas.dart';

Random random = Random();

ExerciseModel randomizeExercise(ExerciseModel exercise) {
  int seriesNumber = random.nextInt(5) + 1;
  int repsNumber = random.nextInt(5) + 1;

  List<int> repsDone = List.generate(seriesNumber, (index) {
    // 10% szans na zmniejszenie liczby powtórzeń
    if (random.nextInt(100) < 10) {
      return repsNumber - 1;
    }
    return repsNumber;
  });

  // 10% szans na zmniejszenie liczby serii
  int seriesDone =
      (random.nextInt(100) < 10) ? repsDone.length - 1 : repsDone.length;

  List<int> restTimes =
      List.generate(repsDone.length, (index) => random.nextInt(120) + 10);

  return ExerciseModel(
    weight: random.nextInt(20) + 50,
    name: exercise.name,
    seriesNumber: seriesNumber,
    seriesDone: seriesDone,
    repsNumber: repsNumber,
    repsDone: repsDone,
    restTimes: restTimes,
  );
}

TrainingSchemaModel randomizeTrainingSchema(
    TrainingSchemaModel trainingSchema) {
  return TrainingSchemaModel(
    name: trainingSchema.name,
    exercises: trainingSchema.exercises
        .map((exercise) => randomizeExercise(exercise))
        .toList(),
  );
}

List<TrainingModel> generateRandomTrainings() {
  List<TrainingModel> trainings = [];

  for (int i = 0; i < 20; i++) {
    TrainingSchemaModel trainingSchema = i % 2 != 0 ? trainingA : trainingB;
    trainingSchema = randomizeTrainingSchema(trainingSchema);

    trainings.add(
      TrainingModel(
        trainingSchema: trainingSchema,
        date: DateTime.now().subtract(Duration(days: 2 + 2 * i)),
        isFinished: true,
        bodyWeight: random.nextInt(5) + 80,
      ),
    );
  }

  return trainings;
}
