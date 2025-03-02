import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(value) {
    _selectedIndex = value;
    update();
  }
  void moveToCategory() {
    _selectedIndex = 1;
    update();
  }

  void moveToHome() {
    _selectedIndex = 0;
    update();
  }
}
