import 'package:get/get.dart';

class CounterController extends GetxController {
  var value = 0.obs;

  void increment() {
    value++;
  }

  void reset() {
    value.value = 0;
  }

  void decrement() {
    value--;
  }
}
