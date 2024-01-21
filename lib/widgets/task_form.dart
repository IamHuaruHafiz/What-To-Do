import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_to_do/model/todo.dart';
import 'package:what_to_do/provider/storage.dart';
import 'package:what_to_do/widgets/priority_item.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({
    super.key,
  });

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  late TextEditingController todoTileController;
  late TextEditingController todoDescriptionController;
  var timeDateStamp = "";
  var category = "";
  var priority = "";

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
    if (todoTile.isEmpty &&
        todoDesc.isEmpty &&
        category.isEmpty &&
        categoryColor.isEmpty &&
        priorityLevel.isEmpty &&
        priority.isEmpty) {
      return;
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
          child: Column(
            children: [
              TextFormField(
                controller: todoTileController,
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
                controller: todoDescriptionController,
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
        ),
        Row(
          children: [
            IconButton(
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
                        debugPrint(dateTimeSelected.toString());
                        setState(() {
                          timeDateStamp = dateTimeSelected.toString();
                        });
                        debugPrint(timeDateStamp);
                      }
                    });
                  }
                });
              },
              icon: const Icon(Icons.timer_outlined),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        title: const Column(
                          children: [
                            Text("Choose Category"),
                            Divider(),
                          ],
                        ),
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
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (contex) {
                      return AlertDialog(
                        elevation: 0,
                        backgroundColor: Theme.of(context).cardColor,
                        title: const Column(
                          children: [
                            Text("Task Priority"),
                            Divider(),
                          ],
                        ),
                        content: const Row(
                          children: [
                            PriorityItem(
                              number: 1,
                            ),
                            PriorityItem(
                              number: 2,
                            ),
                            PriorityItem(
                              number: 3,
                            ),
                          ],
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Save"),
                              ),
                            ],
                          )
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
                      "priorityLevel");
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
