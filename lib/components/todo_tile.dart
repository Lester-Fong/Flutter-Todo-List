import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isDone;
  Function(bool?)? onChanged;
  Function(BuildContext) handleDeleteTask;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.onChanged,
    required this.handleDeleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: handleDeleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.black87,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: const Color(0xFF056A32),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: isDone,
                onChanged: onChanged,
                checkColor: Colors.red[800],
                activeColor: Colors.red[100],
                side: BorderSide(color: Colors.red[100]!),
              ),

              // Text
              Flexible(
                child: Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white70,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
