import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/timer_controller.dart';

class CircularTimeSpentWidget extends StatelessWidget {
  final Color progressColor;
  final Color backgroundColor;
  final Color textColor;

  CircularTimeSpentWidget({
    this.progressColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.put(TimerController());

    return Obx(() {
      Duration timeSpent = timerController.timeSpent.value;

      return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: timeSpent.inSeconds % 60 / 60,
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              backgroundColor: backgroundColor,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${timeSpent.inMinutes}m',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                '${timeSpent.inSeconds % 60}s',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
