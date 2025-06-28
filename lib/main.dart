import 'package:todo/history/history_controller.dart';
import 'package:todo/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todo/todo_controller.dart';

void main() {
  Get.put(TodoController());
  Get.put(HistoryController());
  runApp(GetMaterialApp(home: MainScreen()));
}
