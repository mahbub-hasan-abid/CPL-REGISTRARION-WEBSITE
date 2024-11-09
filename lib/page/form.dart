import 'package:cpl_form/utils/first_section.dart';
import 'package:cpl_form/utils/responsive.dart';
import 'package:cpl_form/utils/secondSection.dart';
import 'package:cpl_form/utils/thirdSection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlayerFormPage extends StatelessWidget {
  const PlayerFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: isMobile
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      firstSection(),
                      secondSection(),
                      SizedBox(height: 50),
                      thirdSection(),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 1, child: firstSection()),
                    Expanded(flex: 1, child: secondSection()),
                    Expanded(flex: 1, child: thirdSection()),
                  ],
                )),
    );
  }
}
