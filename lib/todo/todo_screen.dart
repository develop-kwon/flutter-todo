import 'package:todo/history/history_controller.dart';
import 'package:todo/todo/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();
    final historyController = Get.find<HistoryController>();
    final textController = TextEditingController();

    return Obx(
      () => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoController.todos.length,
              itemBuilder:
                  (_, index) => _buildTodoItem(todoController.todos[index], () {
                    final deleted = todoController.todos[index];

                    historyController.addDeletedTodo(deleted);

                    Get.showSnackbar(
                      GetSnackBar(
                        message: "$deleted 가 삭제되었습니다.",
                        duration: Duration(milliseconds: 1000),
                      ),
                    );

                    Future.delayed(
                      Duration(milliseconds: 1000),
                      () => Get.closeAllSnackbars(),
                    );

                    todoController.removeTodo(deleted);
                  }),
            ),
          ),
          Row(
            children: [
              Expanded(child: TextField(controller: textController)),
              FilledButton(
                onPressed: () {
                  todoController.addTodo(textController.text);
                  textController.clear();
                },
                child: Text("Add"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTodoItem(String todo, Function() onDone) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (_) => onDone()),
        Expanded(child: Text(todo)),
      ],
    );
  }
}
