import 'package:flutter/material.dart';

List<Widget> insertGap({required List<Widget> list, Widget? gap}) {
  List<Widget> retVal = [];

  for (int i = 0; i < list.length; i++) {
    retVal.add(list[i]);
    if (i < list.length - 1) {
      retVal.add(gap ?? SizedBox());
    }
  }

  return retVal;
}
