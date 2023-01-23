import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeed/utils/extension.dart';
import 'package:zeed/views/signin_page.dart';
import 'package:zeed/widgets/app_button.dart';
import 'package:zeed/widgets/app_logo.dart';
import 'package:zeed/widgets/video_container.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppVideoContainer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 80, height: 80, child: AppLogo()),
                Text(
                  'zeed',
                  style: context.textTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 48),
                ),
                const Text('Saving plans | Gift Card'),
                SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: AppPrimaryButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const SignInPage()));
                        },
                        child: const Text('Get Started'))),
              ].mapToPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 3.0)),
            ),
          ),
        ],
      ),
    );
  }
}
