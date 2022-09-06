import 'package:flutter/material.dart';
import 'package:vidflix/screens/login_screen.dart';

typedef DialopgOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialopgOptionBuilder optionsBuilder, // This return a Collection
}) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  final options = optionsBuilder(); // optionis now a map
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        title: Text(title),
        content: Text(content),
        actions: options.keys.map((optionTitle) {
          final T value = options[optionTitle];
          return MainCustomButton(
            color: Colors.black,
            screenWidth: screenWidth * 0.9,
            screenHeight: screenHeight * 1,
            text: optionTitle,
            size: 0.05,
            onPressed: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
          );
        }).toList(),
      );
    },
  );
}
