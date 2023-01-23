import 'package:flutter/material.dart';
import 'package:zeed/constants/app_colors.dart';
import 'package:zeed/utils/extension.dart';
import 'package:zeed/views/signin_page.dart';
import 'package:zeed/widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_intro_content.dart';
import '../widgets/phone_number_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppIntroPageContent(
                title: 'Sign Up',
                subtitle: 'Saving plans | Gift Card',
              ),
              AppTextField(
                onChanged: (v) {
                  setState(() {});
                },
                label: 'Name',
              ),
              PhoneNumberTextField(
                onChanged: (v) {},
                label: 'Mobile Number',
              ),
              AppTextField(
                onChanged: (v) {
                  setState(() {});
                },
                label: 'Email',
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
              SizedBox(
                width: double.infinity,
                height: 56,
                child: AppPrimaryButton(
                  onPressed: () {},
                  child: const Text('Sign Up'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (c) => const SignInPage()));
                },
                child: const Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Already a user? '),
                        TextSpan(
                          text: ' Sign In',
                          style: TextStyle(
                            color: AppColors.appPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ].mapToPadding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
          ),
        ),
      ),
    );
  }
}
