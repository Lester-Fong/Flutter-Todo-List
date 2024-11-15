import 'package:first_flutter_project/components/alert_dialog.dart';
import 'package:first_flutter_project/components/todo_tile.dart';
import 'package:first_flutter_project/database/storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the Hive Box
  final _myTodoTasks = Hive.box('testBox');
  Storage db = Storage();

  @override
  void initState() {
    if (_myTodoTasks.get('TODOLIST') == null) {
      // check if the box storage is empty
      db.mountTodoTasks();
    } else {
      db.populateTodoTasks();
    }
    super.initState();
  }

  // controller for textfield
  final _controller = TextEditingController();

  // Function to handle checkbox
  void handleCheckbox(bool? value, int index) {
    setState(() {
      db.todoTasks[index][1] = !db.todoTasks[index][1];
    });
    db.updateTodoTasks();
  }

  void saveNewTask() {
    setState(() {
      db.todoTasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateTodoTasks();
  }

  // Function to create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancelled: () => Navigator.of(context).pop(),
          );
        });
  }

  // Removing a task from todo list
  void handleDeleteTaskFromList(int index) {
    setState(() {
      db.todoTasks.removeAt(index);
    });
    db.updateTodoTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xDD310101),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('TO DO'),
          elevation: 0,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.red[800],
          child: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
        body: db.todoTasks.isEmpty
            ? const Center(
                child: Text(
                  'No Task For Today',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: db.todoTasks.length,
                itemBuilder: (context, i) {
                  return TodoTile(
                    taskName: db.todoTasks[i][0],
                    isDone: db.todoTasks[i][1],
                    onChanged: (value) => handleCheckbox(value, i),
                    handleDeleteTask: (context) => handleDeleteTaskFromList(i),
                  );
                },
              ));
  }
}
