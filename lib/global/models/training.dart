import 'training_schema.dart';

class TrainingModel {
  final TrainingSchemaModel trainingSchema;
  final DateTime date;
  final bool isFinished;
  final int? bodyWeight;

  TrainingModel({
    required this.trainingSchema,
    required this.date,
    required this.isFinished,
    this.bodyWeight,
  });

  factory TrainingModel.random({
    required TrainingSchemaModel trainingSchema,
    required DateTime date,
  }) {
    return TrainingModel(
      trainingSchema: trainingSchema,
      date: date,
      isFinished: true,
    );
  }

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      trainingSchema: TrainingSchemaModel.fromJson(json['trainingSchema']),
      date: DateTime.parse(json['date']),
      isFinished: json['isFinished'],
      bodyWeight: json['bodyWeight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trainingSchema': trainingSchema.toJson(),
      'date': date.toIso8601String(),
      'isFinished': isFinished,
      'bodyWeight': bodyWeight,
    };
  }

  TrainingModel copyWith({
    TrainingSchemaModel? trainingSchema,
    DateTime? date,
    bool? isFinished,
    int? bodyWeight,
  }) {
    return TrainingModel(
      trainingSchema: trainingSchema ?? this.trainingSchema,
      date: date ?? this.date,
      isFinished: isFinished ?? this.isFinished,
      bodyWeight: bodyWeight ?? this.bodyWeight,
    );
  }
}
