import 'package:flutter/material.dart';

import 'dialog_decoration.dart';

typedef DialogCallBackOptions<T> = Map<GenericDialogButton, T> Function();

class GenericDialogButton {
  final String text;
  final bool primary;

  GenericDialogButton({required this.text, this.primary = false});
}

Future<T?> showGenericDialog<T>(
  BuildContext context, {
  required Color color,
  required Widget icon,
  required String header,
  required String content,
  EdgeInsets? padding,
  DialogDecoration? decoration,
  required DialogCallBackOptions<T> callBack,
}) {
  return showDialog(
      context: context,
      builder: (context) => _GenericDialog<T>(
            color: color,
            decoration: decoration,
            defaultDecoration: DialogDecoration.defaultValue(),
            padding: padding ?? const EdgeInsets.all(16),
            content: content,
            header: header,
            icon: icon,
            callBackOptions: callBack,
          ));
}

class _GenericDialog<T> extends StatelessWidget {
  final String header;
  final String content;
  final Widget icon;
  final Color color;
  final DialogDecoration? decoration;
  final DialogDecoration defaultDecoration;
  final EdgeInsets padding;
  final DialogCallBackOptions<T> callBackOptions;

  const _GenericDialog({
    Key? key,
    required this.decoration,
    required this.icon,
    required this.color,
    required this.padding,
    required this.header,
    required this.content,
    required this.callBackOptions,
    required this.defaultDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: decoration?.elevation ?? defaultDecoration.elevation!,
      shape: decoration?.shape ?? defaultDecoration.shape!,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: padding.top * .4),
          buildThumbIcon(),
          buildHeader(),
          buildContent(context),
          SizedBox(height: padding.top * .4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: callBackOptions().entries.map((e) {
              return buildButton(
                  onTap: () {
                    Navigator.of(context).pop(e.value);
                  },
                  text: e.key.text,
                  primary: e.key.primary);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget buildButton({
    required String text,
    required Function() onTap,
    bool primary = false,
  }) {
    return Padding(
      padding: decoration?.buttonPadding ?? defaultDecoration.buttonPadding!,
      child: RawMaterialButton(
        onPressed: onTap,
        fillColor: primary ? color : null,
        textStyle:
            (decoration?.buttonTextStyle ?? defaultDecoration.buttonTextStyle!)
                .copyWith(
          color: primary ? decoration?.buttonForegroundTextColor : color,
        ),
        elevation:
            decoration?.buttonElevation ?? defaultDecoration.buttonElevation!,
        shape: RoundedRectangleBorder(
          borderRadius: decoration?.buttonBorderRadius ??
              defaultDecoration.buttonBorderRadius!,
          side: BorderSide(
            width: decoration?.secondaryButtonBorderWidth ??
                defaultDecoration.secondaryButtonBorderWidth!,
            color: color,
          ),
        ),
        child: Text(text),
      ),
    );
  }

  Text buildContent(BuildContext context) {
    return Text(
      content,
      textAlign: decoration?.textAlign ?? defaultDecoration.textAlign!,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.8),
      ),
    );
  }

  Padding buildHeader() {
    return Padding(
      padding: padding,
      child: Text(
        header,
        textAlign: decoration?.textAlign ?? defaultDecoration.textAlign!,
        style: (decoration?.headerStyle ?? defaultDecoration.headerStyle!)
            .copyWith(color: color),
      ),
    );
  }

  Widget buildThumbIcon() {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: decoration?.thumbBorderRadius ??
            defaultDecoration.thumbBorderRadius!,
        border: decoration?.thumbBorder ?? defaultDecoration.thumbBorder!,
      ),
      child: Theme(
        data: ThemeData(
            iconTheme: IconThemeData(
          size: decoration?.iconSize ?? defaultDecoration.iconSize!,
          color: color,
        )),
        child: icon,
      ),
    );
  }
}
