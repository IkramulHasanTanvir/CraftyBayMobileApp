import 'package:get/get.dart';

class CurrentNavigationController extends GetxController {
  var currentPage = '';

  void updatePage(String route) {
    currentPage = route;
  }
}