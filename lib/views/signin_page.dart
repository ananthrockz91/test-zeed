import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeed/mixins/app_state_mixin.dart';
import 'package:zeed/utils/extension.dart';
import 'package:zeed/views/register_page.dart';
import 'package:zeed/widgets/app_button.dart';
import 'package:zeed/widgets/phone_number_text_field.dart';
import '../constants/app_colors.dart';
import '../widgets/app_intro_content.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with AppControllerMixin<SignInPage> {
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset(
                      'assets/images/jewel-1.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const AppIntroPageContent(
                          title: 'Sign In',
                          subtitle: 'Saving plans | Gift Card',
                        ),
                        PhoneNumberTextField(
                          onChanged: (v) {
                            phoneNumber = v;
                          },
                          label: 'Mobile Number',
                        ),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'By continuing I agree to '),
                              TextSpan(
                                text: 'terms & conditions',
                                style: TextStyle(
                                  color: AppColors.appPrimaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: ' and'),
                              TextSpan(
                                text: ' privacy policy',
                                style: TextStyle(
                                  color: AppColors.appPrimaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        appController.loading.value
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: AppPrimaryButton(
                                  onPressed: () async {
                                    if (phoneNumber != null &&
                                        phoneNumber!.length == 10) {
                                      await verifyPhoneNumber(phoneNumber!);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Enter a mobile number'),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Get OTP'),
                                ),
                              ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => const RegisterPage()));
                          },
                          child: const Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: 'New User? '),
                                  TextSpan(
                                    text: ' Sign Up',
                                    style: TextStyle(
                                      color: AppColors.appPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ].mapToPadding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
