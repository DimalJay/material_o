import 'package:flutter/material.dart';

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: Colors.grey.shade200,
  isDense: true,
);

class TextFeildPlain extends StatelessWidget {
  final Widget child;
  const TextFeildPlain({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(inputDecorationTheme: _inputDecorationTheme),
      child: child,
    );
  }
}
