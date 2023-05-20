import 'package:flutter/material.dart';

class WorkoutPickWeight extends StatefulWidget {
  const WorkoutPickWeight({super.key});

  @override
  State<WorkoutPickWeight> createState() => _WorkoutPickWeightState();
}

class _WorkoutPickWeightState extends State<WorkoutPickWeight> {
  int pickedWeight = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 300,
          child: ListWheelScrollView(
            onSelectedItemChanged: (value) {
              setState(() {
                pickedWeight = value;
              });
            },
            itemExtent: 60,
            diameterRatio: 1.5,
            children: List<Widget>.generate(150, (index) {
              return Center(
                child: Text(
                  '${index} kg',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: pickedWeight == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            }),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, pickedWeight);
                },
                child: const Text("Save"),
              ),
            ),
          ],
        )
      ],
    );
  }
}
