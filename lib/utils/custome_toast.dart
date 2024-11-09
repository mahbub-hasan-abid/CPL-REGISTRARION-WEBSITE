import 'package:cpl_form/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'package:motion_toast/motion_toast.dart';

class CustomToast {
  final BuildContext context;

  late final bool isMobile;
  final double mHeadingTextSize = 26.0;
  final double mBodyTextSize = 20.0;

  final double tHeadingTextSize = 30.0;
  final double tBodyTextSize = 24.0;

  // Constructor to take the context
  CustomToast(this.context) {
    isMobile = Responsive.isMobile(context);
  }

  // Default success toast
  void showSuccessToast({
    required String title,
    required String description,
    double? width,
    double? height,
  }) {
    MotionToast.success(
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? mHeadingTextSize : tHeadingTextSize)),
      description: Text(description,
          style: TextStyle(fontSize: isMobile ? mBodyTextSize : tBodyTextSize)),
      width: isMobile ? 300 : 600, // Optional width
      height: isMobile ? 100 : 150, // Optional height
    ).show(context);
  }

  // Default error toast
  void showErrorToast({
    required String title,
    required String description,
    double? width,
    double? height,
  }) {
    MotionToast.error(
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? mHeadingTextSize : tHeadingTextSize)),
      description: Text(description,
          style: TextStyle(fontSize: isMobile ? mBodyTextSize : tBodyTextSize)),
      width: isMobile ? 300 : 600, // Optional width
      height: isMobile ? 100 : 150,
    ).show(context);
  }

  // Default warning toast
  void showWarningToast({
    required String title,
    required String description,
    double? width,
    double? height,
  }) {
    MotionToast.warning(
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? mHeadingTextSize : tHeadingTextSize)),
      description: Text(description,
          style: TextStyle(fontSize: isMobile ? mBodyTextSize : tBodyTextSize)),
      width: isMobile ? 300 : 600, // Optional width
      height: isMobile ? 100 : 150,
    ).show(context);
  }

  // Default info toast
  void showInfoToast({
    required String title,
    required String description,
    double? width,
    double? height,
  }) {
    MotionToast.info(
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? mHeadingTextSize : tHeadingTextSize)),
      description: Text(description,
          style: TextStyle(fontSize: isMobile ? mBodyTextSize : tBodyTextSize)),
      width: isMobile ? 300 : 600, // Optional width
      height: isMobile ? 100 : 150,
    ).show(context);
  }

  // Customizable toast for other needs
  void showCustomToast({
    required IconData icon,
    required Color primaryColor,
    required String title,
    required String description,
    Color? secondaryColor,
    double? width,
    double? height,
    MotionToastPosition position = MotionToastPosition.bottom,
    AnimationType animationType = AnimationType.fromBottom,
  }) {
    MotionToast(
      icon: icon,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      title: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? mHeadingTextSize : tHeadingTextSize)),
      description: Text(
        description,
        style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? mBodyTextSize : tBodyTextSize),
      ),
      width: isMobile ? 300 : 600, // Optional width
      height: isMobile ? 100 : 150,
      position: position,
      animationType: animationType,
    ).show(context);
  }
}
