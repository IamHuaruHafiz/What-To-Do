import 'package:flutter/material.dart';

class SetAlertDialogTitle extends StatelessWidget {
  const SetAlertDialogTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const Divider(),
      ],
    );
  }
}
