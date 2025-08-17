import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHomeController extends GetxController {
  var currentIndex = 0.obs;

  final titles = ['Home', 'Payments', 'Expenses', 'Profile'];

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
