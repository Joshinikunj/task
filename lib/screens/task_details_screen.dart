import 'package:flutter/material.dart';
import 'package:task/model/task_model.dart';
import 'package:task/utils/utils.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Task Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(displayHeight(context) * 0.01),
            child: Padding(
              padding: EdgeInsets.all(displayHeight(context) * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    title: 'ID : ',
                    desc: widget.task.id!.toString(),
                  ),
                  SizedBox(height: displayHeight(context) * 0.01),
                  customText(
                    title: 'User Id : ',
                    desc: widget.task.userId!.toString(),
                  ),
                  SizedBox(height: displayHeight(context) * 0.01),
                  customText(
                    title: 'Title : ',
                    desc: widget.task.title!,
                  ),
                  SizedBox(height: displayHeight(context) * 0.01),
                  customText(
                    title: 'Body : ',
                    desc: widget.task.body!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
