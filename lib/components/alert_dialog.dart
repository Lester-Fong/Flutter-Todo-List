import 'dart:ffi';

import 'package:first_flutter_project/components/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancelled;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancelled,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.red[800],
        title: const Text('Create New Task',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // get user input
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Task name...',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Save Button
                    MyButton(btnText: 'Save', onPressed: onSave),

                    //gap
                    const SizedBox(width: 10),

                    // Cancel Button
                    MyButton(btnText: 'Cancel', onPressed: onCancelled)
                  ],
                )
              ],
            )));
  }
}
