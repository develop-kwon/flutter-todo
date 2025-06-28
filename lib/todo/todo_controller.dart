import 'package:get/get.dart';

class TodoController extends GetxController {
  var todos = <String>[].obs;

  void addTodo(String todo) {
    todos.add(todo);
  }

  void removeTodo(String todo) {
    todos.remove(todo);
  }
}