import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:task/model/task_model.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;
  var isLoading = true.obs;
  var page = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        tasks.value = List<TaskModel>.from(
          data.map((task) => TaskModel.fromJson(task)),
        );
        page.value++;
      } else {
        throw Exception('Failed to load tasks');
      }
    } finally {
      isLoading(false);
    }
  }
}
