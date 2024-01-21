import 'package:flutter/material.dart';
import 'package:what_to_do/widgets/task_form.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Wrap(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    child: TaskForm(),
                  ),
                ]),
              );
            });
      },
      child: const Icon(Icons.add_outlined),
    );
  }
}
