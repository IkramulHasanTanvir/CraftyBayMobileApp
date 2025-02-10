import 'package:crafty_bay/app/app.dart';
import 'package:crafty_bay/app/core/current_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  Get.put(CurrentNavigationController());
  runApp(const CraftyBay());
}