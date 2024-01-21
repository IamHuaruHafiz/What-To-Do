import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:what_to_do/model/todo.dart';

class DataStore extends ChangeNotifier {
  static Future<Database> openDb() async {
    final database = await openDatabase(
      join(
        await getDatabasesPath(),
        "todo.db",
      ),
      onCreate: (db, version) async {
        return await db.execute(
            "CREATE TABLE IF NOT EXISTS todo(id TEXT, todoTitle TEXT, todoDesc TEXT, date TEXT, category TEXT, categoryColor TEXT)");
      },
      version: 1,
    );
    return database;
  }

  addTodo(Todo todo) async {
    final db = await openDb();
    await db.insert(
      "todo",
      {
        //Todo
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  static Future<int> editTodo(Todo todo) async {
    final db = await openDb();
    return await db.update(
      "todo",
      {
        //Todo
      },
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

    final List<Map<String, dynamic>> transactions =
        await db.query("todo", orderBy: "date DESC");
    return List.generate(transactions.length, (index) {
      return Todo(
          id: "",
          todoTitle: "todoTitle",
          todoDesc: "todoDesc",
          time: "time",
          category: "category",
          categoryColor: "categoryColor");
    });
  }
}
