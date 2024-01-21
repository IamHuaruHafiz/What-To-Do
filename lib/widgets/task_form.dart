import 'package:flutter/material.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Title",
              enabledBorder: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade500),
              ),
            ),
          ),
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Description",
              enabledBorder: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red.shade500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
