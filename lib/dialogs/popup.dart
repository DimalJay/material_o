import 'package:flutter/material.dart';
import 'package:material_o/dialogs/dialog_decoration.dart';

Future<void> showPopUpDialog(BuildContext context,
    {required Widget child}) async {
  await showDialog(
    context: context,
    builder: (context) => _PopUpDialog(
        decoration: DialogDecoration(),
        defaultDecoration: DialogDecoration.defaultValue(),
        content: child),
  );
}

class _PopUpDialog extends StatelessWidget {
  final DialogDecoration? decoration;
  final DialogDecoration defaultDecoration;
  final Widget content;
  const _PopUpDialog(
      {Key? key,
      this.decoration,
      required this.content,
      required this.defaultDecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: decoration?.padding ?? defaultDecoration.padding!,
      shape: decoration?.shape ?? defaultDecoration.shape!,
      elevation: decoration?.elevation ?? defaultDecoration.elevation,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildHeader(context),
          content,
        ],
      ),
    );
  }

  Row buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [closeButton(context)],
    );
  }

  Widget closeButton(BuildContext context) {
    return InkWell(
        onTap: Navigator.of(context).pop,
        child: Icon(
          Icons.close,
          color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
        ));
  }
}
