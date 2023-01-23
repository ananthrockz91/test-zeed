import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:zeed/utils/extension.dart';
import 'package:zeed/widgets/app_logo.dart';

class AppIntroPageContent extends StatelessWidget {
  const AppIntroPageContent({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 80, height: 80, child: AppLogo()),
        Text(
          title,
          style: context.textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
        ),
        Text(subtitle),
      ].mapToPadding(padding: const EdgeInsets.symmetric(vertical: 3)),
    );
  }
}
