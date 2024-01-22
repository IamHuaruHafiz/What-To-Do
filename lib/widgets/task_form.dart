import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_to_do/model/todo.dart';
import 'package:what_to_do/provider/storage.dart';
import 'package:what_to_do/widgets/alert_dialog_action_buttons.dart';
import 'package:what_to_do/widgets/priority_item.dart';
import 'package:what_to_do/widgets/set_alertdialog_title.dart';
import 'package:what_to_do/widgets/text_form_field.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({
    super.key,
  });

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController todoTileController;
  late TextEditingController todoDescriptionController;
  late String timeDateStamp;
  var category = "";
  var priorityLevel = "1";
  bool timerIncomplete = false;
  bool categoryIncomplete = false;
  bool priorityIncomplete = false;
  @override
  void initState() {
    todoTileController = TextEditingController();
    todoDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    todoDescriptionController.dispose();
    todoTileController.dispose();
    super.dispose();
  }

  void submitData(
    String todoTile,
    String todoDesc,
    String category,
    String categoryColor,
    String priorityLevel,
  ) {
    if (!formKey.currentState!.validate()) {
      if (category.isEmpty ||
          categoryColor.isEmpty ||
          priorityLevel.isEmpty ||
          priorityLevel.isEmpty) {
        setState(() {
          timerIncomplete = true;
          priorityIncomplete = true;
        });
        return;
      }
    } else {
      var todo = Todo(
        id: DateTime.now().toIso8601String(),
        todoTitle: todoTile,
        todoDesc: todoDesc,
        time: timeDateStamp,
        category: category,
        categoryColor: categoryColor,
        priorityLevel: priorityLevel,
      );
      Provider.of<DataStoreProvider>(context, listen: false).addTodo(todo);
      Navigator.of(context).pop();
      debugPrint("success");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add Task",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormFieldWidget(
                controllerName: todoTileController,
                hintText: "Title",
              ),
              TextFormFieldWidget(
                controllerName: todoDescriptionController,
                hintText: "Description",
                maxLines: 4,
              )
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              color: timerIncomplete ? Colors.red : null,
              onPressed: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2080),
                ).then((selectedDate) {
                  if (selectedDate != null) {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((selectedTime) {
                      if (selectedTime != null) {
                        DateTime dateTimeSelected = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            selectedTime.hour,
                            selectedTime.minute);

                        setState(() {
                          timeDateStamp = dateTimeSelected.toString();
                        });
                        debugPrint(timeDateStamp);
                        setState(() {
                          timerIncomplete = false;
                        });
                      }
                    });
                  }
                });
              },
              icon: const Icon(Icons.timer_outlined),
            ),
            IconButton(
              color: categoryIncomplete ? Colors.red : null,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        title:
                            const SetAlertDialogTitle(title: "Choose Category"),
                        content: GridView.count(
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 6,
                          crossAxisCount: 3,
                          children: List.generate(15, (index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                ),
                                Text("$index")
                              ],
                            );
                          }),
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.sell_outlined),
            ),
            IconButton(
              color: priorityIncomplete ? Colors.red : null,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (contex) {
                      return AlertDialog(
                        elevation: 0,
                        backgroundColor: Theme.of(context).cardColor,
                        title: const SetAlertDialogTitle(
                          title: "Edit Task Priority",
                        ),
                        content: Row(
                          children: List.generate(
                            3,
                            (index) => InkWell(
                                onTap: () {
                                  print("hello");
                                },
                                child: PriorityItem(number: index + 1)),
                          ),
                        ),
                        actions: [
                          AlertDialogActionButtons(
                              button1CallBack: () {
                                Navigator.of(context).pop();
                              },
                              button2CallBack: () {
                                Navigator.of(context).pop();
                              },
                              button1Text: "Cancel",
                              button2Text: "Save")
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.flag_outlined),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  submitData(
                      todoTileController.text,
                      todoDescriptionController.text,
                      category,
                      "categoryColor",
                      priorityLevel);
                },
                icon: const Icon(
                  Icons.send_outlined,
                  color: Colors.pink,
                ))
          ],
        )
      ],
    );
  }
}
