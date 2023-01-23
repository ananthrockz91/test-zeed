import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key? key,
      this.initialValue,
      this.onChanged,
      this.validator,
      this.controller,
      this.label,
      this.hintText,
      this.isMultiline,
      this.obscureText = false,
      this.inputFormatters,
      this.keyBoardType,
      this.textCapitalization,
      this.enabled,
      this.textInputAction,
      this.onTap,
      this.onSaved,})
      : super(key: key);

  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool? isMultiline;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyBoardType;
  final TextCapitalization? textCapitalization;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final Function(String?)? onSaved;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: TextFormField(
        obscureText: widget.obscureText,
        enabled: widget.enabled,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          fillColor: Colors.grey[200],
          labelText: widget.label,
          hintText: widget.hintText,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
      ),
    );
  }
}
