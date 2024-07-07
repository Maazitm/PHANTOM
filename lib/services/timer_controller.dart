import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  var timeSpent = Duration.zero.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    _stopTimer();
    super.onClose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      timeSpent.value += Duration(seconds: 1);
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }
}
