import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zeed/constants/app_colors.dart';
import 'package:zeed/firebase_options.dart';
import 'package:zeed/mixins/app_state_mixin.dart';
import 'package:zeed/views/get_started.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AppControllerMixin<MyApp> {
  @override
  void initState() {
    super.initState();
    appController.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zeed',
      theme: ThemeData(
          primaryColor: AppColors.appPrimaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.appPrimaryColor,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.appPrimaryColor,
          )),
      home: const GetStartedPage(),
    );
  }
}
