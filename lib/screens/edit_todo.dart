import 'package:flutter/material.dart';

class EditToDo extends StatefulWidget {
  const EditToDo({
    super.key,
    required this.todoTitle,
    required this.todoDesc,
    required this.category,
    required this.todoPriority,
    required this.time,
  });
  final String todoTitle;
  final String todoDesc;
  final String category;
  final String todoPriority;
  final String time;
  @override
  State<EditToDo> createState() => _EditToDoState();
}

class _EditToDoState extends State<EditToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.circle_outlined),
              title: Text(widget.todoTitle),
              subtitle: Text(
                widget.todoDesc,
                maxLines: 2,
              ),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.edit_document)),
            ),
            IconDataWidget(
                icon: Icons.timer_outlined,
                descText: "Task Time",
                data: widget.time),
            IconDataWidget(
                icon: Icons.timer_outlined,
                descText: "Task Category",
                data: widget.category.isEmpty ? "Default" : widget.category),
            IconDataWidget(
                icon: Icons.timer_outlined,
                descText: "Task Priority",
                data: widget.todoPriority),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline),
                label: const Text("Delete Task")),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Edit Task"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconDataWidget extends StatelessWidget {
  const IconDataWidget({
    super.key,
    required this.icon,
    required this.descText,
    required this.data,
  });
  final IconData icon;
  final String descText;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(icon),
            label: Text("$descText:"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.all(8),
            child: Text(data),
          )
        ],
      ),
    );
  }
}
