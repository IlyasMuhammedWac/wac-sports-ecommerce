import 'package:flutter/material.dart';
import 'package:wac_sports/config/styles/font_palette.dart';

class AuthInputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputAction textInputAction;

  const AuthInputField({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.disabled,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: FontPalette.whiteMedium
              .copyWith(color: Theme.of(context).colorScheme.onSecondary),
          border: _buildBorder(),
          focusedBorder:
              _buildBorder(color: Theme.of(context).colorScheme.onTertiary),
          enabledBorder: _buildBorder(),
          errorBorder: _buildBorder(color: Theme.of(context).colorScheme.error),
          focusedErrorBorder:
              _buildBorder(color: Theme.of(context).colorScheme.error),
          suffixIcon: suffixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.grey),
    );
  }
}
