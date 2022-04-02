import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.iconData,
    this.keyboardType,
    this.onChanged,
    this.obscureText = false,
    this.errorText,
    this.showError = false,
  }) : super(key: key);
  final TextEditingController? controller;
  final String hintText;
  final IconData iconData;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final bool obscureText;
  final String? errorText;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          errorText: showError ? errorText : null,
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          prefixIcon: Icon(iconData),
        ),
      ),
    );
  }
}
