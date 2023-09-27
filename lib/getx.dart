import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp89());
}

class CounterController extends GetxController {
  var counter = 0.obs; // "obs" stands for observable

  void increment() {
    counter++;
  }
}

class MyApp89 extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Counter App'),
        ),
        body: Center(
          child: Obx(() => Text('Counter: ${controller.counter.value}')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}