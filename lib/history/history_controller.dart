import 'package:get/get.dart';

class HistoryController extends GetxController {
  var deletedTodos = <String>[].obs;

  void addDeletedTodo(String todo) {
    deletedTodos.add(todo);
  }
}
