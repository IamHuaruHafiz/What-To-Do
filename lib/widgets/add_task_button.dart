import 'package:flutter/material.dart';
import 'package:what_to_do/widgets/task_buttons.dart';
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
        await showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Task",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const TaskForm(),
                    const TaskButtons()
                  ],
                ),
              );
            });
      },
      child: const Icon(Icons.add_outlined),
    );
  }
}
