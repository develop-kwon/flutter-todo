import 'package:todo/history/history_screen.dart';
import 'package:todo/main_controller.dart';
import 'package:todo/todo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Todo', style: TextStyle(color: Colors.blue[300])),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: controller.currentIndex.value,
                  children: [TodoScreen(), HistoryScreen()],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: "Todo"),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
          ],
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeCurrentIndex,
        ),
      ),
    );
  }
}
