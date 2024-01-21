import 'package:flutter/material.dart';
import 'package:what_to_do/widgets/priority_item.dart';

class TaskButtons extends StatelessWidget {
  const TaskButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((selectedTime) {
                  if (selectedTime != null) {
                    DateTime dateTimeSelected = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute);
                    print(dateTimeSelected);
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
            onPressed: () {},
            icon: const Icon(
              Icons.send_outlined,
              color: Colors.pink,
            ))
      ],
    );
  }
}
