import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:what_to_do/provider/storage.dart';
import 'package:what_to_do/screens/edit_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Home"),
        actions: const [
          CircleAvatar(),
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<DataStoreProvider>(context).todoList(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const SizedBox();
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
              case ConnectionState.active:
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("Nothing to do today"),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data != null) {
                    final data = snapshot.data!;
                    return ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        itemCount: data.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              tileColor: Theme.of(context).primaryColor,
                              shape: const BeveledRectangleBorder(),
                              isThreeLine: true,
                              leading: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.circle_outlined)),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditToDo(
                                      todoTitle: data[index].todoTitle,
                                      todoDesc: data[index].todoDesc,
                                      category: data[index].category,
                                      todoPriority: data[index].priorityLevel,
                                      time: data[index].time,
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                Provider.of<DataStoreProvider>(context,
                                        listen: false)
                                    .deleteTodo(data[index].id);
                              },
                              title: Text(
                                data[index].todoTitle,
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    DateFormat.jm().format(
                                        DateTime.parse(data[index].time)),
                                  ),
                                  const Spacer(),
                                  TextButton.icon(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.blue),
                                        foregroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Colors.white)),
                                    onPressed: () {},
                                    icon: const Icon(Icons.flag),
                                    label: Text(data[index].priorityLevel),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: Text("No"),
                    );
                  }
                }
            }
            return Container();
          }),
    );
  }
}
