import 'package:flutter/material.dart';
import 'package:zeed/widgets/app_text_field.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField(
      {Key? key, required this.label, required this.onChanged})
      : super(key: key);

  final String label;
  final ValueChanged<String> onChanged;

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.grey[200],
      child: Row(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/images/indian_flag.png')),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text('+91'),
              ),
              const Icon(Icons.keyboard_arrow_down_sharp)
            ],
          ),
          Expanded(
              child: AppTextField(
            onChanged: widget.onChanged,
            label: widget.label,
          )),
        ],
      ),
    );
  }
}
