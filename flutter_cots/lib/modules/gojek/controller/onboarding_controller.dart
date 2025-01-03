import 'package:get/get.dart';
import 'package:flutter/material.dart'; // Tambahkan import ini untuk PageController

class OnboardingController extends GetxController {
  var pageController = PageController(); // Inisialisasi PageController
  var pageIndex = 0.obs; // Menggunakan observable untuk pageIndex
}
