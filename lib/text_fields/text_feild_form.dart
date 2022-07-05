import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
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
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
      ),
      child: Focus(
        onFocusChange: (focus) {
          setState(() {
            isFocused = focus;
          });
        },
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: isFocused ? Theme.of(context).primaryColor : Colors.grey,
              )),
          child: widget.child,
        ),
      ),
    );
  }
}
