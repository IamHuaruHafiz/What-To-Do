import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:what_to_do/model/todo.dart';

class DataStoreProvider extends ChangeNotifier {
  static Future<Database> openDb() async {
    final database = await openDatabase(
      join(
        await getDatabasesPath(),
        "todo.db",
      ),
      onCreate: (db, version) async {
        return await db.execute(
            "CREATE TABLE IF NOT EXISTS todo(id TEXT, todoTitle TEXT, todoDesc TEXT, date TEXT, category TEXT, categoryColor TEXT, priorityLevel TEXT)");
      },
      version: 1,
    );
    return database;
  }

  addTodo(Todo todo) async {
    final db = await openDb();
    await db.insert(
      "todo",
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  Future<int> editTodo(Todo todo) async {
    final db = await openDb();
    return await db.update(
      "todo",
      todo.toMap(),
      where: "id = ?",
      whereArgs: [
        //Todo
      ],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  deleteTodo(String id) async {
    final db = await openDb();
    await db.delete(
      "todo",
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
  }

  Future<List<Todo>> todoList() async {
    final db = await openDb();

    final List<Map<String, dynamic>> todos =
        await db.query("todo", orderBy: "date DESC");
    return List.generate(todos.length, (index) {
      return Todo(
          id: todos[index]["id"],
          todoTitle: todos[index]["todoTitle"],
          todoDesc: todos[index]["todoDesc"],
          time: todos[index]["date"],
          category: todos[index]["category"],
          categoryColor: todos[index]["categoryColor"],
          priorityLevel: todos[index]["priorityLevel"]);
    });
  }
}
