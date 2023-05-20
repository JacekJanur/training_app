import 'package:flutter/material.dart';

class GlobalConfirmationModal extends StatelessWidget {
  const GlobalConfirmationModal({
    super.key,
    required this.description,
  });
  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Confirm Your Action',
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              description,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("Confirm"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
