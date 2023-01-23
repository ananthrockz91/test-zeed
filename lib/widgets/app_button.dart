import 'package:flutter/material.dart';
import 'package:zeed/constants/app_colors.dart';

class AppPrimaryButton extends StatefulWidget {
  const AppPrimaryButton(
      {Key? key, required this.onPressed, required this.child})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  State<AppPrimaryButton> createState() => _AppPrimaryButtonState();
}

class _AppPrimaryButtonState extends State<AppPrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      child: widget.child,
    );
  }
}
