import 'package:flutter/material.dart';

Future<void> showModal(BuildContext context, Widget child) async {
  await showModalBottomSheet(
    context: context,
    clipBehavior: Clip.hardEdge,
    enableDrag: false,
    isDismissible: false,
    isScrollControlled: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12),
      ),
    ),
    builder: (context) => child,
  );
}
