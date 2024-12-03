import 'package:flutter/material.dart';
import 'package:wac_sports/core/extension/context.dart';

class TextButtonWithIconWidget extends StatelessWidget {
  const TextButtonWithIconWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.onPressed,
  });
  final IconData iconData;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(context.textColor));
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(iconData),
      label: Text(title),
      style: buttonStyle,
    );
  }
}
