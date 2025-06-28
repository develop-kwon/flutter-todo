import 'package:get/get.dart';

class MainController extends GetxController {
  final currentIndex = 0.obs;

  void changeCurrentIndex(int index) => currentIndex.value = index;
}