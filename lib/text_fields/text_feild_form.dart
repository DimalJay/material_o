import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  const TextFieldForm({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(10, 2, 10, 2),
    this.borderRadius = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: child,
      ),
    );
  }
}
