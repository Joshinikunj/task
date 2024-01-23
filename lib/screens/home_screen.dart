import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/task_controller.dart';
import 'package:task/screens/task_details_screen.dart';
import 'package:task/utils/utils.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isGridView = false;
  final TaskController dataController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Task'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            icon: isGridView
                ? const Icon(Icons.list)
                : const Icon(Icons.grid_view_rounded),
          ),
        ],
      ),
      body: Obx(
        () {
          if (dataController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return isGridView
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: dataController.tasks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var task = dataController.tasks[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => TaskDetailsScreen(task: task));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: displayHeight(context) * 0.01,
                            horizontal: displayWidth(context) * 0.02,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              displayHeight(context) * 0.01,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                customText(
                                  title: 'ID : ',
                                  desc: task.id!.toString(),
                                ),
                                SizedBox(height: displayHeight(context) * 0.01),
                                customText(
                                  title: 'Title : ',
                                  desc: task.title!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: dataController.tasks.length,
                    itemBuilder: (context, index) {
                      var task = dataController.tasks[index];

                      return GestureDetector(
                        onTap: () {
                          Get.to(() => TaskDetailsScreen(task: task));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: displayHeight(context) * 0.01,
                            horizontal: displayWidth(context) * 0.02,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              displayHeight(context) * 0.01,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  title: 'ID : ',
                                  desc: task.id!.toString(),
                                ),
                                SizedBox(height: displayHeight(context) * 0.01),
                                customText(
                                  title: 'Title : ',
                                  desc: task.title!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
