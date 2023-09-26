<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Material-O Flutter UI Package

## Installation

```bash
flutter pub add material_o
```
```yaml
dependencies:
  material_o: ^0.0.6
```

## Create New Dialog Usage

This Widget for Dialogs

```dart
 showGenericDialog(
    context,
    color: Colors.green,
    icon: const Icon(Icons.done),
    header: "Account Create Successful", 
    content: "You have create your account Successfully!",              
    callBack: () => {
        GenericDialogButton(text: 'OK', primary: true): true,
        GenericDialogButton(text: 'CANCEL'): false,
        }
    );
```
## Layout

Column Widget Enhanced with Gap

```dart
ColumnBox(
    gap: 20.0, //double
    children: <Widget>[]
)
```

Row Widget Enhanced with Gap

```dart
RowBox(
    gap: 20.0, //double
    children: <Widget>[]
)
```