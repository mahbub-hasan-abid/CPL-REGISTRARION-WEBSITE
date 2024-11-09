import 'package:cpl_form/utils/coundown.dart';
import 'package:cpl_form/utils/url_launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class thirdSection extends StatelessWidget {
  const thirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCountdownTimer(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Text('Get connected with official CPL Page : '),
                    LinkIcon(
                      url:
                          'https://www.facebook.com/people/CSE-Premier-League/61557673418784/?mibextid=ZbWKwL', // Replace with your desired URL
                      icon: Icons.facebook, // Use any icon you like
                      color: Colors.blue,
                      size: 40.0,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('All rights reserved by '),
                  LinkIcon(
                    url:
                        'https://www.facebook.com/Noiriddho18.PSTU?mibextid=ZbWKwL', // Replace with your desired URL
                    // Use any icon you like
                    color: Colors.blue,
                    text: 'নৈঋদ্ধ-১৮',
                    size: 40.0,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
