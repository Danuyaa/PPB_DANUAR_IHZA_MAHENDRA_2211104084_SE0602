import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul_13/view_model/counter_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              controller.getDialog(); // Memanggil fungsi getDialog
            },
          ),
        ],
      ),
      drawer: controller.getSidebar(), // Memanggil fungsi getSidebar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  controller.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
            const SizedBox(height: 20), // Menambahkan jarak
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/details'); // Navigasi ke DetailPage
              },
              child: const Text('View Detail'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.incrementCounter(); // Memanggil increment
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              controller.decrementCounter(); // Memanggil decrement
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              controller
                  .getBottomSheetView(); // Memanggil fungsi getBottomSheetView
            },
            tooltip: 'Show Bottom Sheet',
            child: const Icon(Icons.arrow_upward), // Ikon panah atas
          ),
        ],
      ),
    );
  }
}