import 'package:flutter/material.dart';

class AlertDialogActionButtons extends StatelessWidget {
  const AlertDialogActionButtons({
    super.key,
    required this.button1CallBack,
    required this.button2CallBack,
    required this.button1Text,
    required this.button2Text,
  });
  final Function() button1CallBack;
  final Function() button2CallBack;
  final String button1Text;
  final String button2Text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextButton(
            onPressed: button1CallBack,
            child: Text(button1Text),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: button2CallBack,
            child: Text(button2Text),
          ),
        ),
      ],
    );
  }
}
