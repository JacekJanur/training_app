import 'package:training_app/global/data/exercises.dart';
import 'package:training_app/global/models/training_schema.dart';

final TrainingSchemaModel trainingA = TrainingSchemaModel(
  name: 'Workout A',
  exercises: [
    exerciseSquat.copyWith(),
    exerciseBenchPress.copyWith(),
    exerciseBarellRow.copyWith(),
  ],
);

final TrainingSchemaModel trainingB = TrainingSchemaModel(
  name: 'Workout B',
  exercises: [
    exerciseSquat.copyWith(),
    exerciseOverheadPress.copyWith(),
    exerciseDeadlift.copyWith(),
  ],
);
