class ExerciseModel {
  final String name;
  final int seriesNumber;
  final int seriesDone;
  final int repsNumber;
  final List<int> repsDone;
  final List<int> restTimes;
  final int weight;

  ExerciseModel({
    required this.name,
    required this.seriesNumber,
    required this.seriesDone,
    required this.repsNumber,
    required this.repsDone,
    required this.weight,
    required this.restTimes,
  });

  factory ExerciseModel.exerciseSquat() => ExerciseModel(
        name: 'Squat',
        seriesNumber: 5,
        seriesDone: 0,
        repsNumber: 5,
        repsDone: [],
        restTimes: [],
        weight: 70,
      );

  factory ExerciseModel.exerciseBenchPress() => ExerciseModel(
        name: 'Bench Press',
        seriesNumber: 5,
        seriesDone: 0,
        repsNumber: 5,
        repsDone: [],
        restTimes: [],
        weight: 50,
      );

  factory ExerciseModel.exerciseBarellRow() => ExerciseModel(
        name: 'Barell Row',
        seriesNumber: 5,
        seriesDone: 0,
        repsNumber: 5,
        repsDone: [],
        restTimes: [],
        weight: 30,
      );
  factory ExerciseModel.exerciseOverheadPress() => ExerciseModel(
        name: 'Overhead Press',
        seriesNumber: 5,
        seriesDone: 0,
        repsNumber: 5,
        repsDone: [],
        restTimes: [],
        weight: 50,
      );

  factory ExerciseModel.exerciseDeadlift() => ExerciseModel(
        name: 'Deadlift',
        seriesNumber: 1,
        seriesDone: 0,
        repsNumber: 5,
        repsDone: [],
        restTimes: [],
        weight: 100,
      );

  factory ExerciseModel.define({
    required String name,
    int repsNumber = 5,
    int seriesNumber = 5,
    int weight = 50,
  }) {
    return ExerciseModel(
      name: name,
      seriesNumber: seriesNumber,
      weight: weight,
      seriesDone: 0,
      repsNumber: repsNumber,
      repsDone: [],
      restTimes: [],
    );
  }

  ExerciseModel copyWith({
    String? name,
    int? seriesNumber,
    int? seriesDone,
    int? repsNumber,
    int? weight,
    List<int>? repsDone,
    List<int>? restTimes,
  }) {
    return ExerciseModel(
      weight: weight ?? this.weight,
      name: name ?? this.name,
      seriesNumber: seriesNumber ?? this.seriesNumber,
      seriesDone: seriesDone ?? this.seriesDone,
      repsNumber: repsNumber ?? this.repsNumber,
      repsDone: repsDone ?? this.repsDone,
      restTimes: restTimes ?? this.restTimes,
    );
  }

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      name: json['name'],
      weight: json['weight'],
      seriesNumber: json['seriesNumber'],
      seriesDone: json['seriesDone'],
      repsNumber: json['repsNumber'],
      repsDone: List<int>.from(json['repsDone'].map((x) => x)),
      restTimes: List<int>.from(json['restTimes'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'weight': weight,
        'seriesNumber': seriesNumber,
        'seriesDone': seriesDone,
        'repsNumber': repsNumber,
        'repsDone': repsDone.map((x) => x).toList(),
        'restTimes': restTimes.map((x) => x).toList(),
      };
}
