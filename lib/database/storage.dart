import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  List todoTasks = [];

  final _myTodoTasks = Hive.box('testBox');

  // called when the app starts and no tasks are available
  void mountTodoTasks() {
    todoTasks = [
      ['Buy groceries', false],
      ['Pay bills', false],
    ];
  }

  // called when the app starts and tasks are available
  void populateTodoTasks() {
    todoTasks = _myTodoTasks.get('TODOLIST');
  }

  // called to update the tasks from db
  void updateTodoTasks() {
    _myTodoTasks.put('TODOLIST', todoTasks);
  }
}
