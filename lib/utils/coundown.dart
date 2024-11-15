import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_countdown/slide_countdown.dart';

class CustomCountdownTimer extends StatelessWidget {
  // Set the target date
  DateTime targetDate = DateTime(2024, 11, 17);
  // Calculate the remaining duration

  @override
  Widget build(BuildContext context) {
    Duration duration = targetDate.difference(DateTime.now());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Remaining Time :', style: TextStyle(fontSize: 24)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideCountdownSeparated(
                duration: duration,
                separatorType: SeparatorType.title,
                replacement: const Text(
                  'End',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                slideDirection: SlideDirection.down,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
                // padding:
                //     const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                separatorStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
