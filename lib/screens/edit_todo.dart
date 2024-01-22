import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_to_do/provider/storage.dart';
import 'package:what_to_do/widgets/alert_dialog_action_buttons.dart';
import 'package:what_to_do/widgets/icon_data_widget.dart';
import 'package:what_to_do/widgets/set_alertdialog_title.dart';
import 'package:what_to_do/widgets/text_form_field.dart';

class EditToDo extends StatefulWidget {
  const EditToDo({
    super.key,
    required this.id,
    required this.todoTitle,
    required this.todoDesc,
    required this.category,
    required this.todoPriority,
    required this.time,
  });
  final String id;
  final String todoTitle;
  final String todoDesc;
  final String category;
  final String todoPriority;
  final String time;
  @override
  State<EditToDo> createState() => _EditToDoState();
}

class _EditToDoState extends State<EditToDo> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    titleController.text = widget.todoTitle;
    descriptionController.text = widget.todoDesc;
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

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
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const SetAlertDialogTitle(
                                title: "Edit Task title"),
                            content: Wrap(children: [
                              Column(
                                children: [
                                  Form(
                                      key: formKey,
                                      child: Column(
                                        children: [
                                          TextFormFieldWidget(
                                              controllerName: titleController,
                                              hintText: "Title"),
                                          TextFormFieldWidget(
                                            controllerName:
                                                descriptionController,
                                            hintText: "Description",
                                            maxLines: 4,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              AlertDialogActionButtons(
                                  button1CallBack: () {
                                    Navigator.of(context).pop();
                                  },
                                  button2CallBack: () {
                                    //final data  = Provider.of<DataStoreProvider>(context).todoList();
                                    if (titleController.text.isEmpty ||
                                        descriptionController.text.isEmpty) {
                                      formKey.currentState!.validate();
                                      return;
                                    }
                                    // final todo = Todo(
                                    //     id: widget.id,
                                    //     todoTitle: titleController.text,
                                    //     todoDesc: descriptionController.text,
                                    //     time: "time",
                                    //     category: "category",
                                    //     categoryColor: "categoryColor",
                                    //     priorityLevel: "priorityLevel");
                                    // Provider.of<DataStoreProvider>(context,
                                    //         listen: false)
                                    //     .editTodo(todo)
                                    //     .then((_) {
                                    //   Navigator.of(context).pop();
                                    // });
                                  },
                                  button1Text: "Cancel",
                                  button2Text: "Edit")
                            ]),
                          );
                        });
                  },
                  icon: const Icon(Icons.edit_document)),
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
                onPressed: () {
                  Provider.of<DataStoreProvider>(context, listen: false)
                      .deleteTodo(widget.id);
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: Theme.of(context).colorScheme.error,
                ),
                label: Text(
                  "Delete Task",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                )),
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
