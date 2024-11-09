import 'package:cpl_form/utils/responsive.dart';
import 'package:flutter/material.dart';

class firstSection extends StatelessWidget {
  const firstSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (isMobile)
            ? SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/cpl_logo.jpg', // Add your image asset here
                  fit: BoxFit.contain,
                ),
              )
            : Image.asset(
                'assets/cpl_logo.jpg', // Add your image asset here
                fit: BoxFit.contain,
              ),
      ],
    );
  }
}
