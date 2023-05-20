import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:training_app/global/models/training.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'widgets/workout_details_exercise.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails({
    super.key,
    required this.training,
  });

  final TrainingModel training;

  @override
  Widget build(BuildContext context) {
    final repaintBoundary = GlobalKey();

    final titleDate = DateFormat('dd-MM-yyyy').format(training.date);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () async {
              final pdf = pw.Document();
              Uint8List? imageBytes =
                  await _getImageFromWidget(repaintBoundary);
              pdf.addPage(
                pw.Page(
                  build: (pw.Context context) => pw.Center(
                    child: pw.Image(
                      pw.MemoryImage(
                        imageBytes!,
                      ),
                    ),
                  ),
                ),
              );

              final output = await getApplicationDocumentsDirectory();
              final file = File("${output.path}/$titleDate.pdf");
              await file.writeAsBytes(await pdf.save()).then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          'PDF Saved',
                        ),
                      ),
                    ),
                  );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.picture_as_pdf_rounded,
              ),
            ),
          ),
        ],
        title: Text(
          titleDate,
        ),
      ),
      body: SingleChildScrollView(
        child: RepaintBoundary(
          key: repaintBoundary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  training.trainingSchema.name,
                  style: textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "${training.trainingSchema.exercises.length} exercises",
                  style: textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              for (final exercise in training.trainingSchema.exercises)
                WorkoutDetailsExercise(
                  exercise: exercise,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List?> _getImageFromWidget(
      GlobalKey<State<StatefulWidget>> repaintBoundary) async {
    final boundary = repaintBoundary.currentContext?.findRenderObject()
        as RenderRepaintBoundary?;
    final image = await boundary?.toImage();
    final byteData = await image?.toByteData(format: ImageByteFormat.png);
    final imageBytes = byteData?.buffer.asUint8List();
    return imageBytes;
  }
}
