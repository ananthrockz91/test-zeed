import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zeed/mixins/app_state_mixin.dart';
import '../constants/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_intro_content.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key? key, required this.verificationId})
      : super(key: key);

  final String verificationId;

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage>
    with AppControllerMixin<VerifyOtpPage> {
  String? smsCode;

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: AppIntroPageContent(
                title: 'Verification',
                subtitle: 'we have sent it to xxxxxxxxxx',
              ),
            ),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.start,
              appContext: context,
              length: 6,
              onChanged: (v) {
                smsCode = v;
              },
              hintCharacter: '●',
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                inactiveColor: Colors.transparent,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0, top: 16.0, left: 16.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Didn't get code? "),
                    TextSpan(
                      text: ' Resend',
                      style: TextStyle(
                        color: AppColors.appPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            appController.loading.value
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: AppPrimaryButton(
                        onPressed: () async {
                          if (smsCode != null) {
                            await verifyOtp(
                                smsCode: smsCode!,
                                verificationId: widget.verificationId);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please enter OTP')));
                          }
                        },
                        child: const Text('Confirm'),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
