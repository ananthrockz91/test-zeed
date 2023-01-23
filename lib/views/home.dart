import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeed/mixins/app_state_mixin.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AppControllerMixin<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('Zeed'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Logged in with mobile number:',
                ),
                Text(
                  '${appController.userModel.value?.phoneNumber}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
        ));
  }
}
