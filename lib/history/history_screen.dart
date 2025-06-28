import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'history_controller.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    return Obx(
          () => ListView.builder(
        itemCount: historyController.deletedTodos.length,
        itemBuilder: (_, index) {
          return ListTile(
            leading: Icon(Icons.history),
            title: Text(historyController.deletedTodos[index]),
          );
        },
      ),
    );
  }
}
