import 'package:flutter/material.dart';

class TCustomeFormField extends StatelessWidget {
  final String hintText;
  // final TextEditingController controller;
  final IconData prifixIcon;
  final bool? isPasswordField;

  const TCustomeFormField({
    super.key,
    required this.hintText,
    required this.prifixIcon,
    this.isPasswordField = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(prifixIcon),
        hintText: hintText,
      ),
    );
  }
}
