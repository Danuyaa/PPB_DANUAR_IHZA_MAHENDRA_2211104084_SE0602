import 'package:get/get.dart';

/// Controller untuk mengelola state counter
class CounterController extends GetxController {
  // Variabel untuk menyimpan nilai counter secara reaktif
  var counter = 0.obs;

  // Fungsi untuk menambah nilai counter
  void increment() => counter++;

  // Fungsi untuk mereset nilai counter
  void reset() => counter.value = 0;
}
