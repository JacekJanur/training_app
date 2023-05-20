import 'package:flutter/material.dart';
import 'package:training_app/global/view/widgets/global_confirmation_modal.dart';

Future<T?> showConfirmationModal<T>({
  required BuildContext context,
  required String description,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => GlobalConfirmationModal(
      description: description,
    ),
    isScrollControlled: true,
  );
}
