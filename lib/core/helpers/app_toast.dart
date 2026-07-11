import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void showSnackBar({
  required String message,
  required AnimatedSnackBarType type,
  required BuildContext context,
}) {
  AnimatedSnackBar.material(message, type: type).show(context);
}
